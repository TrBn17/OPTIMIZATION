# Import necessary libraries
import pandas as pd
from docplex.mp.model import Model

# Load data from the Excel file
file_path = r"C:\Users\Admin\Downloads\Hospital_Bed_Allocation_Sample_Data.xlsx"  # Path to the Excel file
data = pd.ExcelFile(file_path)

# Parse the sheets into DataFrames
patient_data = data.parse('Patient Admissions')  # Contains patient data (elective and emergency)
revenue_cost_data = data.parse('Revenue and Costs')  # Contains revenue and cost details

# Initialize the optimization model
model = Model(name="Hospital Bed Allocation")

# Extract unique departments and days
departments = revenue_cost_data["Department"].tolist()
days = patient_data["Day"].unique().tolist()

# Create dictionaries for revenues, costs, and capacities
revenue = dict(zip(revenue_cost_data["Department"], revenue_cost_data["Revenue per Patient per Day ($)"]))
standard_cost = dict(zip(revenue_cost_data["Department"], revenue_cost_data["Standard Bed Cost per Day ($)"]))
supplementary_cost = dict(zip(revenue_cost_data["Department"], revenue_cost_data["Supplementary Bed Cost per Day ($)"]))
standard_capacity = dict(zip(revenue_cost_data["Department"], revenue_cost_data["Standard Bed Capacity"]))
supplementary_capacity = dict(zip(revenue_cost_data["Department"], revenue_cost_data["Supplementary Bed Capacity"]))

# Calculate total revenue before optimization (baseline)
baseline_revenue = 0
for d in departments:
    for t in days:
        elective = patient_data[(patient_data["Day"] == t) & (patient_data["Department"] == d)]["Elective Patients"].values[0]
        emergency = patient_data[(patient_data["Day"] == t) & (patient_data["Department"] == d)]["Emergency Patients"].values[0]
        total_patients = elective + emergency
        baseline_revenue += revenue[d] * total_patients

# Define decision variables
x = {(d, t): model.integer_var(name=f"x_{d}_{t}") for d in departments for t in days}
y = {(d, t): model.binary_var(name=f"y_{d}_{t}") for d in departments for t in days}

# Define the objective function
model.maximize(
    model.sum(revenue[d] * x[d, t] for d in departments for t in days) -
    model.sum((standard_cost[d] * x[d, t] + supplementary_cost[d] * y[d, t] * supplementary_capacity[d]) 
              for d in departments for t in days)
)

# Add constraints
for d in departments:
    for t in days:
        elective = patient_data[(patient_data["Day"] == t) & (patient_data["Department"] == d)]["Elective Patients"].values[0]
        emergency = patient_data[(patient_data["Day"] == t) & (patient_data["Department"] == d)]["Emergency Patients"].values[0]
        total_patients = elective + emergency
        model.add_constraint(x[d, t] >= total_patients)
        model.add_constraint(x[d, t] <= standard_capacity[d] + y[d, t] * supplementary_capacity[d])

# Solve and save results
solution = model.solve()
if solution:
    optimized_revenue = sum(revenue[d] * solution.get_value(x[d, t]) for d in departments for t in days)

    # Save results to specified path
    save_path = r"C:\Users\Admin\optimization_results.csv"  # Save to C:\Users\Admin
    results = [{
        "Department": d,
        "Day": t,
        "Patients Allocated": int(solution.get_value(x[d, t])),
        "Supplementary Beds Used": int(solution.get_value(y[d, t]))
    } for d in departments for t in days]
    pd.DataFrame(results).to_csv(save_path, index=False)

    # Print baseline and optimized revenues
    print(f"Baseline Revenue (Before Optimization): ${baseline_revenue:,.2f}")
    print(f"Optimized Revenue (After Optimization): ${optimized_revenue:,.2f}")
    print(f"Results have been saved to '{save_path}'")
else:
    print("No feasible solution found.")
