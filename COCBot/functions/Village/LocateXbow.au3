Func LocateXbow()
	While 1
		$MsgBox = MsgBox(1 + 262144, "Locate X-Bow", "Click OK then click on one of your X-Bows", 0, $frmBot)
		If $MsgBox = 1 Then
			WinActivate($HWnD)
			$XbowPos[0] = FindPos()[0]
			$XbowPos[1] = FindPos()[1]
			SetLog("-X-Bow =  " & "(" & $XbowPos[0] & "," & $XbowPos[1] & ")", $COLOR_GREEN)
		EndIf
		ExitLoop
	WEnd
	Click(1, 1)
EndFunc   ;==>LocateXbow