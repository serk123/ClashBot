Func TrainDark()
   If $ichkDarkTroop = 0 Then Return

	If $DarkBarrackPos[0][0] = "" Then
		LocateDarkBarrack()
		SaveConfig()
		If _Sleep(2000) Then Return
	EndIf

	SetLog("Training Dark Troops...", $COLOR_BLUE)

	For $i = 0 To 1
		If _Sleep(500) Then ExitLoop

		ClickP($TopLeftClient) ;Click Away

		If _Sleep(500) Then ExitLoop

		Click($DarkBarrackPos[$i][0], $DarkBarrackPos[$i][1]) ;Click Dark Barrack
		If _Sleep(500) Then ExitLoop

	  Local $TrainPos = _PixelSearch(155, 603, 694, 605, Hex(0x603818, 6), 5) ;Finds Train Troops button
		If IsArray($TrainPos) = False Then
			SetLog("Dark Barrack " & $i + 1 & " is not available", $COLOR_RED)
			If _Sleep(500) Then ExitLoop
		Else
			Click($TrainPos[0], $TrainPos[1]) ;Click Train Troops button
			If _Sleep(800) Then ExitLoop

			   _CaptureRegion()
			   Switch $DarkBarrackTroop[$i]
					Case 0
						While _ColorCheck(_GetPixelColor(230, 312), Hex(0x94DEE8, 6), 20)
							Click(220, 320, 15) ;Minions
							If _Sleep(250) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 1
						While _ColorCheck(_GetPixelColor(336, 306), Hex(0xC5795C, 6), 20)
							Click(331, 320, 10) ;Hogs
							If _Sleep(250) Then ExitLoop
							_CaptureRegion()
						 WEnd
					 Case 2
						While _ColorCheck(_GetPixelColor(418, 300), Hex(0xF87118, 6), 20)
							Click(440, 320, 5) ;Valkyries
							If _Sleep(250) Then ExitLoop
							_CaptureRegion()
						 WEnd
					Case Else
						If _Sleep(50) Then ExitLoop
						_CaptureRegion()
			   EndSwitch
	EndIf
    If _Sleep(100) Then ExitLoop
	Click($TopLeftClient[0], $TopLeftClient[1], 2, 250); Click away twice with 250ms delay
 Next
     SetLog("Dark Troop Training Complete...", $COLOR_BLUE)
 EndFunc   ;==>Train Dark Troop