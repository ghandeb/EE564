' ----------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 3D Version 2016.0 design 
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
oDesign.SetSolutionType "Transient"
Set oModule = oDesign.GetModule("BoundarySetup")
if (oArgs.Count = 1) then 
oModule.EditExternalCircuit oArgs(0), Array(), Array(), Array(), Array()
end if
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", _
  "InsulatorThreshold:=", 2.5e+006)
Set oModule = oDesign.GetModule("MeshSetup")
oModule.InitialMeshSettings Array("NAME:MeshSettings", "MeshMethod:=", _
  "AnsoftTAU")
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "6"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:halfAxial", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "0"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:endRegion", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "138.57668342580791mm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:rotorSkew", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "0"))))
On Error Goto 0
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("steel_1010_3DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:steel_1010_3DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 238.7, "Y:=", 0.2003), Array("NAME:Coordinate", _
  "X:=", 318.3, "Y:=", 0.3204), Array("NAME:Coordinate", "X:=", 358.1, "Y:=", _
  0.40045), Array("NAME:Coordinate", "X:=", 437.7, "Y:=", 0.50055), Array(_
  "NAME:Coordinate", "X:=", 477.5, "Y:=", 0.5606), Array("NAME:Coordinate", _
  "X:=", 636.6, "Y:=", 0.7908), Array("NAME:Coordinate", "X:=", 795.8, "Y:=", _
  0.931), Array("NAME:Coordinate", "X:=", 1114.1, "Y:=", 1.1014), Array(_
  "NAME:Coordinate", "X:=", 1273.2, "Y:=", 1.2016), Array("NAME:Coordinate", _
  "X:=", 1591.5, "Y:=", 1.302), Array("NAME:Coordinate", "X:=", 2228.2, "Y:=", _
  1.4028), Array("NAME:Coordinate", "X:=", 3183.1, "Y:=", 1.524), Array(_
  "NAME:Coordinate", "X:=", 4774.6, "Y:=", 1.626), Array("NAME:Coordinate", _
  "X:=", 6366.2, "Y:=", 1.698), Array("NAME:Coordinate", "X:=", 7957.7, "Y:=", _
  1.73), Array("NAME:Coordinate", "X:=", 15915.5, "Y:=", 1.87), Array(_
  "NAME:Coordinate", "X:=", 31831, "Y:=", 1.99), Array("NAME:Coordinate", _
  "X:=", 47746.5, "Y:=", 2.04), Array("NAME:Coordinate", "X:=", 63662, "Y:=", _
  2.07), Array("NAME:Coordinate", "X:=", 79577.5, "Y:=", 2.095), Array(_
  "NAME:Coordinate", "X:=", 159155, "Y:=", 2.2), Array("NAME:Coordinate", _
  "X:=", 318310, "Y:=", 2.4), Array("NAME:Coordinate", "X:=", 1.90986e+006, _
  "Y:=", 4.4))), "conductivity:=", 2e+006, "mass_density:=", 7872, Array(_
  "NAME:stacking_type", "property_type:=", "ChoiceProperty", "Choice:=", _
  "Lamination"), "stacking_factor:=", "0.95", Array("NAME:stacking_direction", _
  "property_type:=", "ChoiceProperty", "Choice:=", "V(3)"))
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
  "Value:=", "1027.153366851616mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "1.25deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Band", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Band:CreateUserDefinedPart:1", _
  "Length", "750mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "498.15mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "280mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "1027.153366851616mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "1.25deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Shaft:CreateUserDefinedPart:1", _
  "Length", "750mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "498.15mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "1027.153366851616mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "1.25deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "6"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Length", "750mm + 2*endRegion"
On Error Goto 0
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "HalfAxial", "halfAxial"
On Error Goto 0
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "2"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "MasterSheet"))))
oEditor.Copy Array("NAME:Selections", "Selections:=", "MasterSheet")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "MasterSheet1:CreateUserDefinedPart:1", "InfoCore", "3"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "MasterSheet1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "SlaveSheet"))))
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions*(1+halfAxial)"
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignMaster Array("NAME:Master", "Objects:=", Array("MasterSheet"), _
  Array("NAME:CoordSysVector", "Origin:=", Array("0mm", "0mm", "0mm"), _
  "UPos:=", Array("445mm", "0mm", "0mm")), "ReverseV:=", true)
oModule.AssignSlave Array("NAME:Slave", "Objects:=", Array("SlaveSheet"), _
  Array("NAME:CoordSysVector", "Origin:=", Array("0mm", "0mm", "0mm"), _
  "UPos:=", Array("222.50000000000006mm", "385.38130468407519mm", "0mm")), _
  "ReverseV:=", true, "Master:=", "Master", "RelationIsSame:=", false)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
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
  "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "1027.153366851616mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", _
  "0"))), Array("NAME:Attributes", "Name:=", "Stator", "Flags:=", "", _
  "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "steel_1010_3DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_0", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_0:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_0"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "310deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_1", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_1:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_1"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "315deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_2", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_2:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_2"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "10deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_3", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_3:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_3"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "15deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_4", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_4:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_4"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "350deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_5", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_5:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_5"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "355deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_6", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_6:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_6"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "50deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_7", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_7:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_7"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "55deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_8", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_8:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_8"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "30deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_9", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_9:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_9"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "35deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_10", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_10:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_10"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "90deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_11", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_11:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_11"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "95deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_12", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_12:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_12"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "70deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_13", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_13:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_13"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "75deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_14", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_14:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_14"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "130deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_15", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_15:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_15"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "135deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_16", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_16:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_16"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "110deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_17", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_17:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_17"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "115deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_18", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_18:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_18"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "170deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_19", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_19:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_19"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "175deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_20", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_20:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_20"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "150deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_21", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_21:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_21"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "155deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_22", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_22:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_22"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "210deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_23", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_23:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_23"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "215deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_24", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_24:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_24"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "190deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_25", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_25:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_25"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "195deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_26", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_26:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_26"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "250deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_27", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_27:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_27"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "255deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_28", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_28:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_28"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "230deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_29", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_29:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_29"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "235deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_30", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_30:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_30"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "290deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_31", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_31:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_31"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "295deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_32", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_32:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_32"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "270deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_33", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_33:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_33"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "275deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_34", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_34:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_34"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "330deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil_35", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_35:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_35"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "335deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_0", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_0:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_0"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "310deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_1", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_1:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_1"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "315deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_2", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_2:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_2"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "10deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_3", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_3:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_3"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "15deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_4", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_4:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_4"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "350deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_5", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_5:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_5"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "355deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_6", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_6:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_6"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "50deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_7", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_7:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_7"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "55deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_8", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_8:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_8"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "30deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_9", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_9:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_9"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "35deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_10", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_10:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_10"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "90deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_11", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_11:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_11"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "95deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_12", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_12:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_12"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "70deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_13", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_13:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_13"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "75deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_14", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_14:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_14"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "130deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_15", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_15:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_15"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "135deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_16", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_16:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_16"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "110deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_17", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_17:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_17"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "115deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_18", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_18:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_18"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "170deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_19", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_19:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_19"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "175deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_20", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_20:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_20"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "150deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_21", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_21:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_21"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "155deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_22", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_22:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_22"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "210deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_23", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_23:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_23"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "215deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_24", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_24:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_24"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "190deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_25", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_25:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_25"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "195deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_26", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_26:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_26"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "250deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_27", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_27:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_27"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "255deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_28", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_28:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_28"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "230deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_29", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_29:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_29"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "235deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_30", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_30:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_30"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "290deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_31", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_31:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_31"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "295deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_32", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_32:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_32"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "270deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_33", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_33:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_33"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "275deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_34", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_34:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_34"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "330deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "500mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "890mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "72"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "120mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "16mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "1"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "10"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", _
  "CoilTerm_35", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", _
  0, "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "CoilTerm_35:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilTerm_35"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "335deg")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseA", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "2.59878ohm", _
  "Inductance:=", "0H", "Voltage:=", "1102.27 * sin(2*pi*78*time)", _
  "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseB", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "2.59878ohm", _
  "Inductance:=", "0H", "Voltage:=", "1102.27 * sin(2*pi*78*time-2*pi/3)", _
  "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseC", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "2.59878ohm", _
  "Inductance:=", "0H", "Voltage:=", "1102.27 * sin(2*pi*78*time-4*pi/3)", _
  "ParallelBranchesNum:=", "1")
oModule.AssignCoilTerminal Array("NAME:PhARe_0", "Objects:=", Array(_
  "CoilTerm_0"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhARe_1", "Objects:=", Array(_
  "CoilTerm_1"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_2", "Objects:=", Array("CoilTerm_2"), _
  "Conductor number:=", 2, "Point out of terminal:=", false, "Winding:=", _
  "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_3", "Objects:=", Array("CoilTerm_3"), _
  "Conductor number:=", 2, "Point out of terminal:=", false, "Winding:=", _
  "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhBRe_4", "Objects:=", Array(_
  "CoilTerm_4"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhBRe_5", "Objects:=", Array(_
  "CoilTerm_5"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_6", "Objects:=", Array("CoilTerm_6"), _
  "Conductor number:=", 2, "Point out of terminal:=", false, "Winding:=", _
  "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_7", "Objects:=", Array("CoilTerm_7"), _
  "Conductor number:=", 2, "Point out of terminal:=", false, "Winding:=", _
  "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhCRe_8", "Objects:=", Array(_
  "CoilTerm_8"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhCRe_9", "Objects:=", Array(_
  "CoilTerm_9"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_10", "Objects:=", Array(_
  "CoilTerm_10"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_11", "Objects:=", Array(_
  "CoilTerm_11"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhARe_12", "Objects:=", Array(_
  "CoilTerm_12"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhARe_13", "Objects:=", Array(_
  "CoilTerm_13"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_14", "Objects:=", Array(_
  "CoilTerm_14"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_15", "Objects:=", Array(_
  "CoilTerm_15"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhBRe_16", "Objects:=", Array(_
  "CoilTerm_16"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhBRe_17", "Objects:=", Array(_
  "CoilTerm_17"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_18", "Objects:=", Array(_
  "CoilTerm_18"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_19", "Objects:=", Array(_
  "CoilTerm_19"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhCRe_20", "Objects:=", Array(_
  "CoilTerm_20"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhCRe_21", "Objects:=", Array(_
  "CoilTerm_21"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_22", "Objects:=", Array(_
  "CoilTerm_22"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_23", "Objects:=", Array(_
  "CoilTerm_23"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhARe_24", "Objects:=", Array(_
  "CoilTerm_24"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhARe_25", "Objects:=", Array(_
  "CoilTerm_25"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_26", "Objects:=", Array(_
  "CoilTerm_26"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_27", "Objects:=", Array(_
  "CoilTerm_27"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhBRe_28", "Objects:=", Array(_
  "CoilTerm_28"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhBRe_29", "Objects:=", Array(_
  "CoilTerm_29"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_30", "Objects:=", Array(_
  "CoilTerm_30"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_31", "Objects:=", Array(_
  "CoilTerm_31"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhCRe_32", "Objects:=", Array(_
  "CoilTerm_32"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhCRe_33", "Objects:=", Array(_
  "CoilTerm_33"), "Conductor number:=", 2, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_34", "Objects:=", Array(_
  "CoilTerm_34"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_35", "Objects:=", Array(_
  "CoilTerm_35"), "Conductor number:=", 2, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Coil", "RefineInside:=", true, _
  "Objects:=", Array("Coil_0", "Coil_1", "Coil_2", "Coil_3", "Coil_4", _
  "Coil_5", "Coil_6", "Coil_7", "Coil_8", "Coil_9", "Coil_10", "Coil_11", _
  "Coil_12", "Coil_13", "Coil_14", "Coil_15", "Coil_16", "Coil_17", "Coil_18", _
  "Coil_19", "Coil_20", "Coil_21", "Coil_22", "Coil_23", "Coil_24", "Coil_25", _
  "Coil_26", "Coil_27", "Coil_28", "Coil_29", "Coil_30", "Coil_31", "Coil_32", _
  "Coil_33", "Coil_34", "Coil_35"), "RestrictElem:=", false, "NumMaxElem:=", _
  "1000", "RestrictLength:=", true, "MaxLength:=", "26mm")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Coil", "Objects:=", Array(_
  "Coil_0", "Coil_1", "Coil_2", "Coil_3", "Coil_4", "Coil_5", "Coil_6", _
  "Coil_7", "Coil_8", "Coil_9", "Coil_10", "Coil_11", "Coil_12", "Coil_13", _
  "Coil_14", "Coil_15", "Coil_16", "Coil_17", "Coil_18", "Coil_19", "Coil_20", _
  "Coil_21", "Coil_22", "Coil_23", "Coil_24", "Coil_25", "Coil_26", "Coil_27", _
  "Coil_28", "Coil_29", "Coil_30", "Coil_31", "Coil_32", "Coil_33", "Coil_34", _
  "Coil_35"), "NormalDevChoice:=", 2, "NormalDev:=", "30deg", _
  "AspectRatioChoice:=", 1)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "496.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "280mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
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
  "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "1027.153366851616mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", _
  "0"))), Array("NAME:Attributes", "Name:=", "Rotor", "Flags:=", "", _
  "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "steel_1010_3DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "Skew", "rotorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SquirrelCage", "Version:=", "12.11", _
  "NoOfParameters:=", 24, "Library:=", "syslib", Array("NAME:ParamVector", _
  Array("NAME:Pair", "Name:=", "DiaGap", "Value:=", "496.3mm"), Array(_
  "NAME:Pair", "Name:=", "DiaYoke", "Value:=", "280mm"), Array("NAME:Pair", _
  "Name:=", "Length", "Value:=", "750mm"), Array("NAME:Pair", "Name:=", _
  "Skew", "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", _
  "84"), Array("NAME:Pair", "Name:=", "SlotType", "Value:=", "2"), Array(_
  "NAME:Pair", "Name:=", "Hs0", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Hs01", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "2.5mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "30mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "10mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "8mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "BarEndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "RingLength", "Value:=", "12mm"), Array("NAME:Pair", "Name:=", "RingHeight", _
  "Value:=", "20mm"), Array("NAME:Pair", "Name:=", "RingDiaGap", "Value:=", _
  "0mm"), Array("NAME:Pair", "Name:=", "CastRotor", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "30deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "1027.153366851616mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", _
  "Bar", "Flags:=", "", "Color:=", "(119 198 206)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper_75C", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Bar:CreateUserDefinedPart:1", _
  "Skew", "rotorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", "Bar:CreateUserDefinedPart:1", _
  "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Bar", _
  "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
oEditor.SeparateBody  Array("NAME:Selections", "Selections:=", "Bar")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetEddyEffect Array("NAME:Eddy Effect Setting", Array(_
  "NAME:EddyEffectVector", Array("NAME:Data", "Object Name:=", "Bar", _
  "Eddy Effect:=", true)))
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Bar", "RefineInside:=", true, _
  "Objects:=", Array("Bar"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "16mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "496.3mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "280mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "750mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
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
  "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "1027.153366851616mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", _
  "100"))), Array("NAME:Attributes", "Name:=", "InnerRegion", "Flags:=", "", _
  "Color:=", "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "InnerRegion:CreateUserDefinedPart:1", "Skew", "rotorSkew"
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "InnerRegion:CreateUserDefinedPart:1", "LenRegion", "750mm + 2*endRegion"
On Error Goto 0
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Main", "RefineInside:=", true, _
  "Objects:=", Array("Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", _
  "Shaft"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "157.48mm")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Band", _
  "OuterRegion", "InnerRegion", "MasterSheet", "SlaveSheet"), Array(_
  "NAME:ChangedProps", Array("NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Band,InnerRegion" & _
  ",Shaft,Stator,Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8,Coil_9,Coil_10,Coil_11,Coil_12,Coil_13,Coil_14,Coil_15,Coil_16" & _
  ",Coil_17,Coil_18,Coil_19,Coil_20,Coil_21,Coil_22,Coil_23,Coil_24" & _
  ",Coil_25,Coil_26,Coil_27,Coil_28,Coil_29,Coil_30,Coil_31,Coil_32" & _
  ",Coil_33,Coil_34,Coil_35,CoilTerm_0,CoilTerm_1,CoilTerm_2,CoilTerm_3" & _
  ",CoilTerm_4,CoilTerm_5,CoilTerm_6,CoilTerm_7,CoilTerm_8,CoilTerm_9" & _
  ",CoilTerm_10,CoilTerm_11,CoilTerm_12,CoilTerm_13,CoilTerm_14" & _
  ",CoilTerm_15,CoilTerm_16,CoilTerm_17,CoilTerm_18,CoilTerm_19" & _
  ",CoilTerm_20,CoilTerm_21,CoilTerm_22,CoilTerm_23,CoilTerm_24" & _
  ",CoilTerm_25,CoilTerm_26,CoilTerm_27,CoilTerm_28,CoilTerm_29" & _
  ",CoilTerm_30,CoilTerm_31,CoilTerm_32,CoilTerm_33,CoilTerm_34" & _
  ",CoilTerm_35,Rotor,Bar", "Tool Parts:=", "Tool"), Array(_
  "NAME:SubtractParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.FitAll
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:ChangedProps", _
  Array("NAME:rotorSkew", "Value:=", "8.57143deg"))))
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:MotionSetup1", "Move Type:=", "Rotate", _
  "Coordinate System:=", "Global", "Axis:=", "Z", "Is Positive:=", true, _
  "InitPos:=", "0deg", "HasRotateLimit:=", false, "NonCylindrical:=", false, _
  "Consider Mechanical Transient:=", true, "Angular Velocity:=", "1520rpm", _
  "Moment of Inertia:=", 34.8444, "Damping:=", 0.507126, "Load Torque:=", _
  "if(speed<162.709, -2.0356*speed, -53891.2/speed)", "Objects:=", Array(_
  "Band"))
oModule.EditMotionSetup Array("NAME:Data", "Consider Mechanical Transient:=", _
  false)
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
set oUnclassified = oEditor.GetObjectsInGroup("Unclassified")
Dim oObject
For Each oObject in oUnclassified
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", oObject), Array(_
  "NAME:ChangedProps", Array("NAME:Model", "Value:=", false))))
Next
oEditor.ShowWindow
