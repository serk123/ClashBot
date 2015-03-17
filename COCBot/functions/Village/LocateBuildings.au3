;GB - New file including all locate functions plus new ones

Func LocateBarrack()
	SetLog("Locating Barracks...", $COLOR_BLUE)
	Local $MsgBox
	While 1
		While 1
			$MsgBox = MsgBox(6 + 262144, "Locate first barrack", "Click Continue then click on your first barrack. Cancel if not available. Try again to start over.", 0, $frmBot)
			If $MsgBox = 11 Then
				$barrackPos[0][0] = FindPos()[0]
				$barrackPos[0][1] = FindPos()[1]
			ElseIf $MsgBox = 10 Then
				ExitLoop
			Else
				For $i=0 To 3
				   $barrackPos[$i][0] = ""
				   $barrackPos[$i][1] = ""
			    Next
				ExitLoop (2)
			EndIf
			If _Sleep(500) Then ExitLoop
			$MsgBox = MsgBox(6 + 262144, "Locate second barrack", "Click Continue then click on your second barrack. Cancel if not available. Try again to start over.", 0, $frmBot)
			If $MsgBox = 11 Then
				$barrackPos[1][0] = FindPos()[0]
				$barrackPos[1][1] = FindPos()[1]
			ElseIf $MsgBox = 10 Then
				ExitLoop
			Else
				For $i=1 To 3
				   $barrackPos[$i][0] = ""
				   $barrackPos[$i][1] = ""
			    Next
				ExitLoop (2)
			EndIf
			If _Sleep(500) Then ExitLoop
			$MsgBox = MsgBox(6 + 262144, "Locate third barrack", "Click Continue then click on your third barrack. Cancel if not available. Try again to start over.", 0, $frmBot)
			If $MsgBox = 11 Then
				$barrackPos[2][0] = FindPos()[0]
				$barrackPos[2][1] = FindPos()[1]
			ElseIf $MsgBox = 10 Then
				ExitLoop
			Else
				For $i=2 To 3
				   $barrackPos[$i][0] = ""
				   $barrackPos[$i][1] = ""
			    Next
				ExitLoop (2)
			EndIf
			If _Sleep(500) Then ExitLoop
			$MsgBox = MsgBox(6 + 262144, "Locate fourth barrack", "Click Continue then click on your fourth barrack. Cancel if not available. Try again to start over.", 0, $frmBot)
			If $MsgBox = 11 Then
				$barrackPos[3][0] = FindPos()[0]
				$barrackPos[3][1] = FindPos()[1]
			ElseIf $MsgBox = 10 Then
				ExitLoop
			Else
				$barrackPos[3][0] = ""
				$barrackPos[3][1] = ""
			EndIf
			If GUICtrlRead($chkRequest) = $GUI_CHECKED And $CCPos[0] = -1 Then LocateClanCastle()
			ExitLoop (2)
		WEnd
	WEnd
	SaveConfig()
	SetLog("-Locating Complete-", $COLOR_BLUE)
	SetLog("-Barrack 1 = " & "(" & $barrackPos[0][0] & "," & $barrackPos[0][1] & ")", $COLOR_GREEN)
	SetLog("-Barrack 2 = " & "(" & $barrackPos[1][0] & "," & $barrackPos[1][1] & ")", $COLOR_GREEN)
	SetLog("-Barrack 3 = " & "(" & $barrackPos[2][0] & "," & $barrackPos[2][1] & ")", $COLOR_GREEN)
	SetLog("-Barrack 4 = " & "(" & $barrackPos[3][0] & "," & $barrackPos[3][1] & ")", $COLOR_GREEN)
 EndFunc   ;==>LocateBarrack

 Func LocateClanCastle()
	While 1
		$MsgBox = MsgBox(1 + 262144, "Locate Clan Castle", "Click OK then click on your Clan Castle", 0, $frmBot)
		If $MsgBox = 1 Then
			$CCPos[0] = FindPos()[0]
			$CCPos[1] = FindPos()[1]
			SetLog("-Clan Castle =  " & "(" & $CCPos[0] & "," & $CCPos[1] & ")", $COLOR_GREEN)
		EndIf
		ExitLoop
	WEnd
 EndFunc   ;==>LocateClanCastle

 Func LocateCollectors()
	SetLog("Locating Collectors...", $COLOR_BLUE)
	Local $MsgBox
	While 1
		For $i = 0 To 16
			$MsgBox = MsgBox(6 + 262144, "Locate collector #" & $i + 1, "Click Continue then click on your collector #" & $i + 1 & ". Cancel if not available. Try again to start over.", 0, $frmBot)
			If $MsgBox = 11 Then
				$collectorPos[$i][0] = FindPos()[0]
				$collectorPos[$i][1] = FindPos()[1]
				If _Sleep(500) Then ExitLoop
			ElseIf $MsgBox = 10 Then
				ExitLoop
			Else
				For $i=$i To 16
					$collectorPos[$i][0] = ""
					$collectorPos[$i][1] = ""
				Next
				ExitLoop (2)
			EndIf
			SetLog("-Collector #" & $i + 1 & " = " & "(" & $collectorPos[$i][0] & "," & $collectorPos[$i][1] & ")", $COLOR_GREEN)
		Next
		ExitLoop
	WEnd
	SaveConfig()
	SetLog("-Locating Complete-", $COLOR_BLUE)
 EndFunc   ;==>LocateCollectors

 Func LocateInferno()
	While 1
		$MsgBox = MsgBox(3 + 262144, "Locate Inferno Tower", "Click Yes if you want to enable Inferno Tower reloading then click on one of your Inferno Towers. Click No if you wish to disable this option or Cancel to exit.", 0, $frmBot)
		If $MsgBox = 6 Then
			WinActivate($HWnD)
			$InfernoPos[0] = FindPos()[0]
			$InfernoPos[1] = FindPos()[1]
			SetLog("-Inferno Tower =  " & "(" & $InfernoPos[0] & "," & $InfernoPos[1] & ")", $COLOR_GREEN)
		ElseIf $MsgBox = 7 Then
			$InfernoPos[0] = -1
			$InfernoPos[1] = -1
			SetLog("-Inferno Tower reloading disabled", $COLOR_GREEN)
		EndIf
		ExitLoop
	WEnd
	Click(1, 1)
 EndFunc   ;==>LocateInferno

 Func LocateTrap()
	While 1
		$MsgBox = MsgBox(3 + 262144, "Locate Trap", "Click Yes if you want to enable Trap re-arming then click on one of your Traps. Click No if you wish to disable this option or Cancel to exit.", 0, $frmBot)
		If $MsgBox = 6 Then
			WinActivate($HWnD)
			$TrapPos[0] = FindPos()[0]
			$TrapPos[1] = FindPos()[1]
			SetLog("-Trap =  " & "(" & $TrapPos[0] & "," & $TrapPos[1] & ")", $COLOR_GREEN)
		ElseIf $MsgBox = 7 Then
			$TrapPos[0] = -1
			$TrapPos[1] = -1
			SetLog("-Trap re-arming disabled", $COLOR_GREEN)
		EndIf
		ExitLoop
	WEnd
	Click(1, 1)
 EndFunc   ;==>LocateTrap

 Func LocateXbow()
	While 1
		$MsgBox = MsgBox(3 + 262144, "Locate X-Bow", "Click Yes if you want to enable X-Bow reloading then click on one of your X-Bows. Click No if you wish to disable this option or Cancel to exit.", 0, $frmBot)
		If $MsgBox = 6 Then
			WinActivate($HWnD)
			$XbowPos[0] = FindPos()[0]
			$XbowPos[1] = FindPos()[1]
			SetLog("-X-Bow =  " & "(" & $XbowPos[0] & "," & $XbowPos[1] & ")", $COLOR_GREEN)
		ElseIf $MsgBox = 7 Then
			$XbowPos[0] = -1
			$XbowPos[1] = -1
			SetLog("-X-Bow reloading disabled", $COLOR_GREEN)
		EndIf
		ExitLoop
	WEnd
	Click(1, 1)
EndFunc   ;==>LocateXbow