' ----------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 2D Version 2016.0 design 
' Can specify one arg to setup external circuit                         
' ----------------------------------------------------------------------

On Error Resume Next
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
On Error Goto 0
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oArgs = AnsoftScript.arguments
oDesktop.RestoreWindow
Set oProject = oDesktop.GetActiveProject()
Set oDesign = oProject.GetActiveDesign()
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient", "XY"
Set oModule = oDesign.GetModule("BoundarySetup")
if (oArgs.Count = 1) then 
oModule.EditExternalCircuit oArgs(0), Array(), Array(), Array(), Array()
end if
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
Set oModule = oDesign.GetModule("MeshSetup")
oModule.InitialMeshSettings Array("NAME:MeshSettings", "MeshMethod:=", _
  "AnsoftTAU")
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "6"))))
On Error Goto 0
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("JFE_Steel_50JN600_2DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:JFE_Steel_50JN600_2DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 10, "Y:=", 0.0142506), Array("NAME:Coordinate", _
  "X:=", 20, "Y:=", 0.0180513), Array("NAME:Coordinate", "X:=", 30, "Y:=", _
  0.0380019), Array("NAME:Coordinate", "X:=", 40, "Y:=", 0.0646025), Array(_
  "NAME:Coordinate", "X:=", 50, "Y:=", 0.0978531), Array("NAME:Coordinate", _
  "X:=", 60, "Y:=", 0.172904), Array("NAME:Coordinate", "X:=", 70, "Y:=", _
  0.304004), Array("NAME:Coordinate", "X:=", 80, "Y:=", 0.439855), Array(_
  "NAME:Coordinate", "X:=", 100, "Y:=", 0.709656), Array("NAME:Coordinate", _
  "X:=", 125, "Y:=", 0.959508), Array("NAME:Coordinate", "X:=", 150, "Y:=", _
  1.07161), Array("NAME:Coordinate", "X:=", 175, "Y:=", 1.14286), Array(_
  "NAME:Coordinate", "X:=", 200, "Y:=", 1.19606), Array("NAME:Coordinate", _
  "X:=", 250, "Y:=", 1.25972), Array("NAME:Coordinate", "X:=", 300, "Y:=", _
  1.29867), Array("NAME:Coordinate", "X:=", 400, "Y:=", 1.34523), Array(_
  "NAME:Coordinate", "X:=", 500, "Y:=", 1.37183), Array("NAME:Coordinate", _
  "X:=", 800, "Y:=", 1.4241), Array("NAME:Coordinate", "X:=", 1000, "Y:=", _
  1.44501), Array("NAME:Coordinate", "X:=", 1500, "Y:=", 1.48399), Array(_
  "NAME:Coordinate", "X:=", 2000, "Y:=", 1.51443), Array("NAME:Coordinate", _
  "X:=", 2500, "Y:=", 1.53726), Array("NAME:Coordinate", "X:=", 3000, "Y:=", _
  1.55914), Array("NAME:Coordinate", "X:=", 4000, "Y:=", 1.5953), Array(_
  "NAME:Coordinate", "X:=", 5000, "Y:=", 1.62481), Array("NAME:Coordinate", _
  "X:=", 8000, "Y:=", 1.69625), Array("NAME:Coordinate", "X:=", 10000, "Y:=", _
  1.73438), Array("NAME:Coordinate", "X:=", 15000, "Y:=", 1.80499), Array(_
  "NAME:Coordinate", "X:=", 20000, "Y:=", 1.85661), Array("NAME:Coordinate", _
  "X:=", 30000, "Y:=", 1.92278), Array("NAME:Coordinate", "X:=", 50000, "Y:=", _
  2.00194), Array("NAME:Coordinate", "X:=", 80000, "Y:=", 2.05038), Array(_
  "NAME:Coordinate", "X:=", 380000, "Y:=", 2.53473))), Array(_
  "NAME:core_loss_type", "property_type:=", "ChoiceProperty", "Choice:=", _
  "Electrical Steel"), "core_loss_kh:=", 540.85, "core_loss_kc:=", 0.492137, _
  "core_loss_ke:=", 4.24604, "conductivity:=", 3.125e+006, "mass_density:=", _
  7362.5) 
end if
if (oDefinitionManager.DoesMaterialExist("steel_1010_2DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:steel_1010_2DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 238.7, "Y:=", 0.1903), Array("NAME:Coordinate", _
  "X:=", 318.3, "Y:=", 0.3044), Array("NAME:Coordinate", "X:=", 358.1, "Y:=", _
  0.38045), Array("NAME:Coordinate", "X:=", 437.7, "Y:=", 0.47555), Array(_
  "NAME:Coordinate", "X:=", 477.5, "Y:=", 0.5326), Array("NAME:Coordinate", _
  "X:=", 636.6, "Y:=", 0.7513), Array("NAME:Coordinate", "X:=", 795.8, "Y:=", _
  0.8845), Array("NAME:Coordinate", "X:=", 1114.1, "Y:=", 1.0464), Array(_
  "NAME:Coordinate", "X:=", 1273.2, "Y:=", 1.1416), Array("NAME:Coordinate", _
  "X:=", 1591.5, "Y:=", 1.237), Array("NAME:Coordinate", "X:=", 2228.2, "Y:=", _
  1.3328), Array("NAME:Coordinate", "X:=", 3183.1, "Y:=", 1.448), Array(_
  "NAME:Coordinate", "X:=", 4774.6, "Y:=", 1.545), Array("NAME:Coordinate", _
  "X:=", 6366.2, "Y:=", 1.6135), Array("NAME:Coordinate", "X:=", 7957.7, _
  "Y:=", 1.644), Array("NAME:Coordinate", "X:=", 15915.5, "Y:=", 1.7775), _
  Array("NAME:Coordinate", "X:=", 31831, "Y:=", 1.8925), Array(_
  "NAME:Coordinate", "X:=", 47746.5, "Y:=", 1.941), Array("NAME:Coordinate", _
  "X:=", 63662, "Y:=", 1.9705), Array("NAME:Coordinate", "X:=", 79577.5, _
  "Y:=", 1.99525), Array("NAME:Coordinate", "X:=", 159155, "Y:=", 2.1), _
  Array("NAME:Coordinate", "X:=", 318310, "Y:=", 2.3), Array(_
  "NAME:Coordinate", "X:=", 1.90986e+006, "Y:=", 4.3))), "conductivity:=", _
  2e+006, "mass_density:=", 7478.4) 
end if
if (oDefinitionManager.DoesMaterialExist("copper_75C")) then
else
oDefinitionManager.AddMaterial Array("NAME:copper_75C", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), "conductivity:=", "5.8e+007")
end if
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "498.15mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "280mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0.625deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Band", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "498.15mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "280mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0.625deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "498.15mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0.625deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "6"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
On Error Goto 0
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions"
Set oModule = oDesign.GetModule("BoundarySetup")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "385.38130468407525mm", "YPosition:=", _
  "222.49999999999997mm", "ZPosition:=", "0mm"))
oModule.AssignVectorPotential Array("NAME:VectorPotential1", "Edges:=", Array(edgeID), _
  "Value:=", "0", "CoordinateSystem:=", "")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "222.5mm", "YPosition:=", "0mm", _
  "ZPosition:=", "0mm"))
oModule.AssignMaster Array("NAME:Master1", "Edges:=", Array(edgeID), _
  "ReverseV:=", false)
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "111.25000000000003mm", "YPosition:=", _
  "192.69065234203759mm", "ZPosition:=", "0mm"))
oModule.AssignSlave Array("NAME:Slave1", "Edges:=", Array(edgeID), _
  "ReverseU:=", true, "Master:=", "Master1", "SameAsMaster:=", false)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", "ModelDepth:=", _
  "750mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "HalfSlot", _
  "Value:=", "0"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "15deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Stator", "Flags:=", "", "Color:=", _
  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "JFE_Steel_50JN600_2DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "Coil", _
  "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Coil"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "5deg", _
  "NumClones:=", "72"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Coil_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_0,Coil_12,Coil_24" & _
  ",Coil_36,Coil_48,Coil_60"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_1,Coil_13,Coil_25" & _
  ",Coil_37,Coil_49,Coil_61"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_2,Coil_14,Coil_26" & _
  ",Coil_38,Coil_50,Coil_62"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_3,Coil_15,Coil_27" & _
  ",Coil_39,Coil_51,Coil_63"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_4,Coil_16,Coil_28" & _
  ",Coil_40,Coil_52,Coil_64"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_5,Coil_17,Coil_29" & _
  ",Coil_41,Coil_53,Coil_65"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_6,Coil_18,Coil_30" & _
  ",Coil_42,Coil_54,Coil_66"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_7,Coil_19,Coil_31" & _
  ",Coil_43,Coil_55,Coil_67"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_8,Coil_20,Coil_32" & _
  ",Coil_44,Coil_56,Coil_68"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_9,Coil_21,Coil_33" & _
  ",Coil_45,Coil_57,Coil_69"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_10,Coil_22,Coil_34" & _
  ",Coil_46,Coil_58,Coil_70"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_11,Coil_23,Coil_35" & _
  ",Coil_47,Coil_59,Coil_71"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseA", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "0.0134214ohm", _
  "Inductance:=", "0.000137289H", "Voltage:=", "1102.27 * sin(2*pi*78*time)", _
  "ParallelBranchesNum:=", "2")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseB", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "0.0134214ohm", _
  "Inductance:=", "0.000137289H", "Voltage:=", _
  "1102.27 * sin(2*pi*78*time-2*pi/3)", "ParallelBranchesNum:=", "2")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseC", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "0.0134214ohm", _
  "Inductance:=", "0.000137289H", "Voltage:=", _
  "1102.27 * sin(2*pi*78*time-4*pi/3)", "ParallelBranchesNum:=", "2")
oModule.AssignCoil Array("NAME:PhA_0", "Objects:=", Array("Coil_0"), _
  "Conductor number:=", 4, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_1", "Objects:=", Array("Coil_1"), _
  "Conductor number:=", 4, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_2", "Objects:=", Array("Coil_2"), _
  "Conductor number:=", 4, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_3", "Objects:=", Array("Coil_3"), _
  "Conductor number:=", 4, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhB_4", "Objects:=", Array("Coil_8"), _
  "Conductor number:=", 4, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_5", "Objects:=", Array("Coil_9"), _
  "Conductor number:=", 4, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_6", "Objects:=", Array("Coil_10"), _
  "Conductor number:=", 4, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_7", "Objects:=", Array("Coil_11"), _
  "Conductor number:=", 4, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhCRe_8", "Objects:=", Array("Coil_6"), _
  "Conductor number:=", 4, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_9", "Objects:=", Array("Coil_7"), _
  "Conductor number:=", 4, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_34", "Objects:=", Array("Coil_4"), _
  "Conductor number:=", 4, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_35", "Objects:=", Array("Coil_5"), _
  "Conductor number:=", 4, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Coil", "RefineInside:=", true, _
  "Objects:=", Array("Coil_0", "Coil_1", "Coil_2", "Coil_3", "Coil_4", _
  "Coil_5", "Coil_6", "Coil_7", "Coil_8", "Coil_9", "Coil_10", "Coil_11"), _
  "RestrictElem:=", false, "NumMaxElem:=", "1000", "RestrictLength:=", true, _
  "MaxLength:=", "6.5mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "496.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "280mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "84"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "30mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "8mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "HalfSlot", _
  "Value:=", "0"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "15deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Rotor", "Flags:=", "", "Color:=", _
  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "steel_1010_2DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SquirrelCage", "Version:=", "12.11", _
  "NoOfParameters:=", 24, "Library:=", "syslib", Array("NAME:ParamVector", _
  Array("NAME:Pair", "Name:=", "DiaGap", "Value:=", "496.3mm"), Array(_
  "NAME:Pair", "Name:=", "DiaYoke", "Value:=", "280mm"), Array("NAME:Pair", _
  "Name:=", "Length", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "84"), _
  Array("NAME:Pair", "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs01", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "2.5mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "30mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "8mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "HalfSlot", "Value:=", "0"), Array("NAME:Pair", "Name:=", "BarEndExt", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "RingLength", "Value:=", _
  "12mm"), Array("NAME:Pair", "Name:=", "RingHeight", "Value:=", "20mm"), _
  Array("NAME:Pair", "Name:=", "RingDiaGap", "Value:=", "0mm"), Array(_
  "NAME:Pair", "Name:=", "CastRotor", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "SegAngle", "Value:=", "15deg"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCoil", _
  "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Bar", "Flags:=", "", _
  "Color:=", "(119 198 206)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper_75C", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Bar:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Bar", _
  "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
oEditor.SeparateBody  Array("NAME:Selections", "Selections:=", "Bar")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignEndConnection Array("NAME:EndConnection1", "Objects:=", Array(_
  "Bar", "Bar_Separate1", "Bar_Separate2", "Bar_Separate3", "Bar_Separate4", _
  "Bar_Separate5", "Bar_Separate6", "Bar_Separate7", "Bar_Separate8", _
  "Bar_Separate9", "Bar_Separate10", "Bar_Separate11", "Bar_Separate12", _
  "Bar_Separate13"), "ResistanceValue:=", "1.26896e-006ohm", _
  "InductanceValue:=", "3.61269e-008H")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Bar", "RefineInside:=", true, _
  "Objects:=", Array("Bar", "Bar_Separate1", "Bar_Separate2", "Bar_Separate3", _
  "Bar_Separate4", "Bar_Separate5", "Bar_Separate6", "Bar_Separate7", _
  "Bar_Separate8", "Bar_Separate9", "Bar_Separate10", "Bar_Separate11", _
  "Bar_Separate12", "Bar_Separate13"), "RestrictElem:=", false, _
  "NumMaxElem:=", "1000", "RestrictLength:=", true, "MaxLength:=", "4mm")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Bar", "Objects:=", Array("Bar", _
  "Bar_Separate1", "Bar_Separate2", "Bar_Separate3", "Bar_Separate4", _
  "Bar_Separate5", "Bar_Separate6", "Bar_Separate7", "Bar_Separate8", _
  "Bar_Separate9", "Bar_Separate10", "Bar_Separate11", "Bar_Separate12", _
  "Bar_Separate13"), "SurfDevChoice:=", 2, "SurfDev:=", "0.24815mm", _
  "NormalDevChoice:=", 2, "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "496.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "280mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "84"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "30mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "8mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "HalfSlot", _
  "Value:=", "0"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "15deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "InnerRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "InnerRegion:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Main", "Objects:=", Array(_
  "Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", "Shaft"), _
  "SurfDevChoice:=", 2, "SurfDev:=", "0.445mm", "NormalDevChoice:=", 2, _
  "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Main", "RefineInside:=", true, _
  "Objects:=", Array("Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", _
  "Shaft"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "39.37mm")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Band", _
  "OuterRegion", "InnerRegion"), Array("NAME:ChangedProps", Array(_
  "NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Band,InnerRegion" & _
  ",Shaft,Stator,Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8,Coil_9,Coil_10,Coil_11,Rotor", "Tool Parts:=", "Tool"), Array(_
  "NAME:SubtractParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:MotionSetup1", "Move Type:=", "Rotate", _
  "Coordinate System:=", "Global", "Axis:=", "Z", "Is Positive:=", true, _
  "InitPos:=", "0deg", "HasRotateLimit:=", false, "NonCylindrical:=", false, _
  "Consider Mechanical Transient:=", true, "Angular Velocity:=", "1549.36rpm", _
  "Moment of Inertia:=", 34.8444, "Damping:=", 1.32323, "Load Torque:=", _
  "if(speed<160.422, -49.7519*speed, -1.28038e+006/speed)", "Objects:=", Array(_
  "Band"))
oModule.EditMotionSetup "MotionSetup1", Array("NAME:Data", _
  "Consider Mechanical Transient:=", false)
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "FastReachSteadyState:=", _
  true, "FrequencyOfAddedVoltageSource:=", "78Hz", "StopTime:=", "0.02s", _
  "TimeStep:=", "0.0001s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.001ms" 
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Torque", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Moving1.Torque")), Array()
oModule.CreateReport "Currents", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Current(PhaseA)", "Current(PhaseB)", _
  "Current(PhaseC)")), Array()
oModule.CreateReport "Induced Voltages", "Transient", "XY Plot", _
  "Setup1 : Transient", Array(), Array("Time:=", Array("All")), Array(_
  "X Component:=", "Time", "Y Component:=", Array("InducedVoltage(PhaseA)", _
  "InducedVoltage(PhaseB)", "InducedVoltage(PhaseC)")), Array()
oModule.CreateReport "Flux Linkages", "Transient", "XY Plot", _
  "Setup1 : Transient", Array(), Array("Time:=", Array("All")), Array(_
  "X Component:=", "Time", "Y Component:=", Array("FluxLinkage(PhaseA)", _
  "FluxLinkage(PhaseB)", "FluxLinkage(PhaseC)")), Array()
oModule.CreateReport "Voltages", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("InputVoltage(PhaseA)", "InputVoltage(PhaseB)", _
  "InputVoltage(PhaseC)")), Array()
oModule.CreateReport "Powers", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array(_
  "InputVoltage(PhaseA)*Current(PhaseA) + InputVoltage(PhaseB)*Current(PhaseB) + InputVoltage(PhaseC)*Current(PhaseC)", _
  "Moving1.Speed*Moving1.Torque")), Array()
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", _
  "Powers:InputVoltage(PhaseA)*Current(PhaseA) + InputVoltage(PhaseB)*Current(PhaseB) + InputVoltage(PhaseC)*Current(PhaseC)"), _
  Array("NAME:ChangedProps", Array("NAME:Specify Name", "Value:=", true))))
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", _
  "Powers:InputVoltage(PhaseA)*Current(PhaseA) + InputVoltage(PhaseB)*Current(PhaseB) + InputVoltage(PhaseC)*Current(PhaseC)"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "ElecPower"))))
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", "Powers:Moving1.Speed*Moving1.Torque"), Array(_
  "NAME:ChangedProps", Array("NAME:Specify Name", "Value:=", true))))
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Trace", Array(_
  "NAME:PropServers", "Powers:Moving1.Speed*Moving1.Torque"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "MechPower"))))
oModule.AddTraceCharacteristics "Torque", "avg", Array(), Array("Specified", _
  "0.01s", "0.02s")
oModule.AddTraceCharacteristics "Currents", "rms", Array(), Array("Specified", _
  "0.01s", "0.02s")
oModule.AddTraceCharacteristics "Currents", "avg", Array(), Array("Specified", _
  "0.01s", "0.02s")
oModule.AddTraceCharacteristics "Voltages", "rms", Array(), Array("Specified", _
  "0.01s", "0.02s")
oModule.AddTraceCharacteristics "Induced Voltages", "rms", Array(), Array(_
  "Specified", "0.01s", "0.02s")
oModule.AddTraceCharacteristics "Powers", "avg", Array(), Array("Specified", _
  "0.01s", "0.02s")
oEditor.ShowWindow
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetupYConnection Array(Array("NAME:YConnection", "Windings:=", _
  "PhaseA,PhaseB,PhaseC"))
