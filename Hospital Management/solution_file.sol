<?xml version = "1.0" encoding="UTF-8" standalone="yes"?>
<CPLEXSolution version="1.2">
 <header
   problemName="problem"
   objectiveValue="22125"
   solutionTypeValue="1"
   solutionTypeString="basic"
   solutionStatusValue="1"
   solutionStatusString="optimal"
   solutionMethodString="dual"
   primalFeasible="1"
   dualFeasible="1"
   simplexIterations="0"
   writeLevel="1"/>
 <quality
   epRHS="9.9999999999999995e-07"
   epOpt="9.9999999999999995e-07"
   maxPrimalInfeas="0"
   maxDualInfeas="0"
   maxPrimalResidual="0"
   maxDualResidual="0"
   maxX="20"
   maxPi="500"
   maxSlack="7"
   maxRedCost="0"
   kappa="7.5"/>
 <linearConstraints>
  <constraint name="c1_Internal_Medicine_Monday" index="0" status="LL" slack="0" dual="300"/>
  <constraint name="c2_Internal_Medicine_Monday" index="1" status="LL" slack="0" dual="200"/>
  <constraint name="c3_Internal_Medicine_Monday" index="2" status="BS" slack="-1" dual="0"/>
  <constraint name="c1_Surgery_Monday" index="3" status="LL" slack="0" dual="500"/>
  <constraint name="c2_Surgery_Monday" index="4" status="LL" slack="0" dual="350"/>
  <constraint name="c3_Surgery_Monday" index="5" status="BS" slack="-5" dual="0"/>
  <constraint name="c1_Pediatrics_Monday" index="6" status="LL" slack="0" dual="250"/>
  <constraint name="c2_Pediatrics_Monday" index="7" status="LL" slack="0" dual="175"/>
  <constraint name="c3_Pediatrics_Monday" index="8" status="BS" slack="-7" dual="0"/>
 </linearConstraints>
 <variables>
  <variable name="x_Internal_Medicine_Monday" index="0" status="BS" value="20" reducedCost="0"/>
  <variable name="y_Internal_Medicine_Monday" index="1" status="BS" value="5" reducedCost="0"/>
  <variable name="x_Surgery_Monday" index="2" status="BS" value="15" reducedCost="0"/>
  <variable name="y_Surgery_Monday" index="3" status="BS" value="5" reducedCost="0"/>
  <variable name="x_Pediatrics_Monday" index="4" status="BS" value="20" reducedCost="0"/>
  <variable name="y_Pediatrics_Monday" index="5" status="BS" value="5" reducedCost="0"/>
 </variables>
 <objectiveValues>
  <objective index="0" name="obj" value="22125"/>
 </objectiveValues>
</CPLEXSolution>
