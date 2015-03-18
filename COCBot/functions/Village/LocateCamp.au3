
Func LocateCamp()
	While 1
		$MsgBox = MsgBox(1 + 262144, "Locate Camp", "Click OK then click on one of your camps", 0, $frmBot)
	    If $MsgBox = 1 Then
		   $ArmyPos[0] = FindPos()[0]
		   $ArmyPos[1] = FindPos()[1]
		   SetLog("-ArmyCamp =  " & "(" & $ArmyPos[0] & "," & $ArmyPos[1] & ")", $COLOR_GREEN)
		EndIf
		ExitLoop
	 WEnd
	     $itxtcampCap = InputBox("Total Camp Capacity", "Enter Your Total Troop Capacity", "200", " M3")
		 If $itxtcampCap >= 25 Then
		 GUICtrlSetData($txtCapacity, $itxtcampCap)
	  Else
		 MsgBox(4096, "Error", "Please input the correct value")
	  EndIf
EndFunc   ;==>LocateCamp