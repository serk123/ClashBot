Func TrainDark()
   If $ichkDarkTroop = 0 Then Return

	If $DarkBarrackPos[0][0] = "" Then
		LocateDarkBarrack()
		SaveConfig()
		If _Sleep(2000) Then Return
	EndIf

	SetLog("Training Dark Troops...", $COLOR_BLUE)

	Global $LeftRax1, $LeftRax2, $TrainDrax1, $TrainDrax2, $ClickRax1, $ClickRax2

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

	If $fullArmy Or $FirstDarkTrain Then
		 If Not _ColorCheck(_GetPixelColor(497, 195), Hex(0xE0E4D0, 6), 20) Then
		 Click(496, 190, 80,2)
		 EndIf
	    $TrainDrax1 = True
	    $TrainDrax2 = True
	EndIf

If GUICtrlRead($txtDarkBarrack1) <> "0" And $i = 0 And $TrainDrax1 = True Then
				If $DarkBarrackTroop[$i] = 0 Then
						Local $troopMinion = Number(getOther(171 + 107 * 0, 278, "Barrack"))
					    If $itxtDarkBarrack1 <= 10 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eMinion, $itxtDarkBarrack1)
						    $TrainDrax1 = False
					    SetLog("Dark Barrack 1 Train Minion Completed...", $COLOR_BLUE)
						ElseIf $itxtDarkBarrack1 > 10 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eMinion, 10)
							$LeftRax1 = ($itxtDarkBarrack1 - 10)
						    $ClickRax1 = $LeftRax1
					    SetLog("Dark Barrack 1 Minion Remaining : " & $LeftRax1 , $COLOR_BLUE)
						ElseIf $LeftRax1 > 5 And ($troopMinion <= 15) Then
							TrainIt($eMinion, 5)
							$LeftRax1 = ($ClickRax1 - 5)
						    $ClickRax1 = $LeftRax1
					    SetLog("Dark Barrack 1 Minion Remaining : " & $LeftRax1 , $COLOR_BLUE)
						ElseIf $LeftRax1 <= 5 And ($troopMinion <= 15) Then
							TrainIt($eMinion, $LeftRax1)
						    $TrainDrax1 = False
					    SetLog("Dark Barrack 1 Train Minion Completed...", $COLOR_BLUE)
						Else
					    SetLog("Dark Barrack 1 Training in progress, Minion Remaining : " & $LeftRax1 , $COLOR_BLUE)
						EndIf
					 EndIf

				If $DarkBarrackTroop[$i] = 1 Then
						Local $troopHog = Number(getOther(171 + 107 * 1, 278, "Barrack"))
					    If $itxtDarkBarrack1 <= 10 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eHog, $itxtDarkBarrack1)
						    $TrainDrax1 = False
					    SetLog("Dark Barrack 1 Train Hog Completed...", $COLOR_BLUE)
						ElseIf $itxtDarkBarrack1 > 10 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eHog, 10)
							$LeftRax1 = ($itxtDarkBarrack1 - 10)
						    $ClickRax1 = $LeftRax1
					    SetLog("Dark Barrack 1 Hog Remaining : " & $LeftRax1 , $COLOR_BLUE)
						ElseIf $LeftRax1 > 1 And ($troopHog <= 9) Then
							TrainIt($eHog, 1)
							$LeftRax1 = ($ClickRax1 - 1)
						    $ClickRax1 = $LeftRax1
					    SetLog("Dark Barrack 1 Hog Remaining : " & $LeftRax1 , $COLOR_BLUE)
						ElseIf $LeftRax1 <= 1 And ($troopHog <= 9) Then
							TrainIt($eHog, $LeftRax1)
						    $TrainDrax1 = False
					    SetLog("Dark Barrack 1 Train Hog Completed...", $COLOR_BLUE)
						Else
					    SetLog("Dark Barrack 1 Training in progress, Hog Remaining : " & $LeftRax1 , $COLOR_BLUE)
						EndIf
					 EndIf

				If $DarkBarrackTroop[$i] = 2 Then
						Local $troopValkyrie = Number(getOther(171 + 107 * 2, 278, "Barrack"))
					    If $itxtDarkBarrack1 <= 7 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eValkyrie, $itxtDarkBarrack1)
						    $TrainDrax1 = False
					    SetLog("Dark Barrack 1 Train Valkyrie Completed...", $COLOR_BLUE)
						ElseIf $itxtDarkBarrack1 > 7 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eValkyrie, 7)
							$LeftRax1 = ($itxtDarkBarrack1 - 7)
						    $ClickRax1 = $LeftRax1
					    SetLog("Dark Barrack 1 Valkyrie Remaining : " & $LeftRax1 , $COLOR_BLUE)
						ElseIf $LeftRax1 > 1 And ($troopValkyrie <= 6) Then
							TrainIt($eValkyrie, 1)
							$LeftRax1 = ($ClickRax1 - 1)
						    $ClickRax1 = $LeftRax1
					    SetLog("Dark Barrack 1 Valkyrie Remaining : " & $LeftRax1 , $COLOR_BLUE)
						ElseIf $LeftRax1 <= 1 And ($troopValkyrie <= 6) Then
							TrainIt($eValkyrie, $LeftRax1)
						    $TrainDrax1 = False
					    SetLog("Dark Barrack 1 Train Valkyrie Completed...", $COLOR_BLUE)
						Else
					    SetLog("Dark Barrack 1 Training in progress, Valkyrie Remaining : " & $LeftRax1 , $COLOR_BLUE)
						EndIf
					 EndIf
EndIf

If GUICtrlRead($txtDarkBarrack2) <> "0" And $i = 1 And $TrainDrax2 = True Then
				If $DarkBarrackTroop[$i] = 0 Then
						Local $troopMinion2 = Number(getOther(171 + 107 * 0, 278, "Barrack"))
					    If $itxtDarkBarrack2 <= 10 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eMinion, $itxtDarkBarrack2)
						    $TrainDrax2 = False
					    SetLog("Dark Barrack 2 Train Minion Completed...", $COLOR_BLUE)
						ElseIf $itxtDarkBarrack2 > 10 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eMinion, 10)
							$LeftRax2 = ($itxtDarkBarrack2 - 10)
						    $ClickRax2 = $LeftRax2
					    SetLog("Dark Barrack 2 Minion Remaining : " & $LeftRax2 , $COLOR_BLUE)
						ElseIf $LeftRax2 > 5 And ($troopMinion2 <= 15) Then
							TrainIt($eMinion, 5)
							$LeftRax2 = ($ClickRax2 - 5)
						    $ClickRax2 = $LeftRax2
					    SetLog("Dark Barrack 2 Minion Remaining : " & $LeftRax2 , $COLOR_BLUE)
						ElseIf $LeftRax2 <= 5 And ($troopMinion2 <= 15) Then
							TrainIt($eMinion, $LeftRax2)
						    $TrainDrax2 = False
					    SetLog("Dark Barrack 2 Train Minion Completed...", $COLOR_BLUE)
						Else
					    SetLog("Dark Barrack 2 Training in progress, Minion Remaining : " & $LeftRax2 , $COLOR_BLUE)
						EndIf
					 EndIf

				If $DarkBarrackTroop[$i] = 1 Then
						Local $troopHog2 = Number(getOther(171 + 107 * 1, 278, "Barrack"))
					    If $itxtDarkBarrack2 <= 10 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eHog, $itxtDarkBarrack2)
						    $TrainDrax2 = False
					    SetLog("Dark Barrack 2 Train Hog Completed...", $COLOR_BLUE)
						ElseIf $itxtDarkBarrack2 > 10 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eHog, 10)
							$LeftRax2 = ($itxtDarkBarrack2 - 10)
						    $ClickRax2 = $LeftRax2
					    SetLog("Dark Barrack 2 Hog Remaining : " & $LeftRax2 , $COLOR_BLUE)
						ElseIf $LeftRax2 > 1 And ($troopHog2 <= 9) Then
							TrainIt($eHog, 1)
							$LeftRax2 = ($ClickRax2 - 1)
						    $ClickRax2 = $LeftRax2
					    SetLog("Dark Barrack 2 Hog Remaining : " & $LeftRax2 , $COLOR_BLUE)
						ElseIf $LeftRax2 <= 1 And ($troopHog2 <= 9) Then
							TrainIt($eHog, $LeftRax2)
						    $TrainDrax2 = False
					    SetLog("Dark Barrack 2 Train Hog Completed...", $COLOR_BLUE)
						Else
					    SetLog("Dark Barrack 2 Training in progress, Hog Remaining : " & $LeftRax2 , $COLOR_BLUE)
						EndIf
					 EndIf

				If $DarkBarrackTroop[$i] = 2 Then
						Local $troopValkyrie2 = Number(getOther(171 + 107 * 2, 278, "Barrack"))
					    If $itxtDarkBarrack2 <= 7 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eValkyrie, $itxtDarkBarrack2)
						    $TrainDrax2 = False
					    SetLog("Dark Barrack 2 Train Valkyrie Completed...", $COLOR_BLUE)
						ElseIf $itxtDarkBarrack2 > 7 And ($fullArmy Or $FirstDarkTrain) Then
							TrainIt($eValkyrie, 7)
							$LeftRax2 = ($itxtDarkBarrack2 - 7)
						    $ClickRax2 = $LeftRax2
					    SetLog("Dark Barrack 2 Valkyrie Remaining : " & $LeftRax2 , $COLOR_BLUE)
						ElseIf $LeftRax2 > 1 And ($troopValkyrie2 <= 6) Then
							TrainIt($eValkyrie, 1)
							$LeftRax2 = ($ClickRax2 - 1)
						    $ClickRax2 = $LeftRax2
					    SetLog("Dark Barrack 2 Valkyrie Remaining : " & $LeftRax2 , $COLOR_BLUE)
						ElseIf $LeftRax2 <= 1 And ($troopValkyrie2 <= 6) Then
							TrainIt($eValkyrie, $LeftRax2)
						    $TrainDrax2 = False
					    SetLog("Dark Barrack 2 Train Valkyrie Completed...", $COLOR_BLUE)
						Else
					    SetLog("Dark Barrack 2 Training in progress, Valkyrie Remaining : " & $LeftRax2 , $COLOR_BLUE)
						EndIf
					 EndIf
EndIf

#cs
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
#ce
	EndIf
    If _Sleep(100) Then ExitLoop
	Click($TopLeftClient[0], $TopLeftClient[1], 2, 250); Click away twice with 250ms delay
 Next
     SetLog("Dark Troop Training Complete...", $COLOR_BLUE)
	 $FirstDarkTrain = False
  EndFunc   ;==>Train Dark Troop