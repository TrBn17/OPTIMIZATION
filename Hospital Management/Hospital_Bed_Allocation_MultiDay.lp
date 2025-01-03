Maximize
 obj:  + 500 x_Internal Medicine_Monday + 500 y_Internal Medicine_Monday - 200 x_Internal Medicine_Monday - 300 y_Internal Medicine_Monday + 800 x_Surgery_Monday + 800 y_Surgery_Monday - 300 x_Surgery_Monday - 450 y_Surgery_Monday + 400 x_Pediatrics_Monday + 400 y_Pediatrics_Monday - 150 x_Pediatrics_Monday - 225 y_Pediatrics_Monday
Subject To
 c1_Internal Medicine_Monday: x_Internal Medicine_Monday <= 20
 c2_Internal Medicine_Monday: y_Internal Medicine_Monday <= 5
 c3_Internal Medicine_Monday: x_Internal Medicine_Monday + y_Internal Medicine_Monday >= 24
 c1_Surgery_Monday: x_Surgery_Monday <= 15
 c2_Surgery_Monday: y_Surgery_Monday <= 5
 c3_Surgery_Monday: x_Surgery_Monday + y_Surgery_Monday >= 15
 c1_Pediatrics_Monday: x_Pediatrics_Monday <= 20
 c2_Pediatrics_Monday: y_Pediatrics_Monday <= 5
 c3_Pediatrics_Monday: x_Pediatrics_Monday + y_Pediatrics_Monday >= 18
Bounds
 x_Internal Medicine_Monday >= 0
 y_Internal Medicine_Monday >= 0
 x_Surgery_Monday >= 0
 y_Surgery_Monday >= 0
 x_Pediatrics_Monday >= 0
 y_Pediatrics_Monday >= 0
End
