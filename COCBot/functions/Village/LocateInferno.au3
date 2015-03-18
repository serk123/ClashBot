Func LocateInferno()
	While 1
		$MsgBox = MsgBox(1 + 262144, "Locate Inferno Tower", "Click OK then click on one of your inferno towers", 0, $frmBot)
		If $MsgBox = 1 Then
			WinActivate($HWnD)
			$InfernoPos[0] = FindPos()[0]
			$InfernoPos[1] = FindPos()[1]
			SetLog("-Inferno Tower =  " & "(" & $InfernoPos[0] & "," & $InfernoPos[1] & ")", $COLOR_GREEN)
		EndIf
		ExitLoop
	WEnd
	Click(1, 1)
EndFunc   ;==>LocateInferno