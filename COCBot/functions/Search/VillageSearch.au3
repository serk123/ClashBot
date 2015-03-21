;Searches for a village that until meets conditions
Global $AtkDeadEnabled, $AtkAnyEnabled

Func VillageSearch() ;Control for searching a village that meets conditions
	Local $skippedVillages
	_WinAPI_EmptyWorkingSet(WinGetProcess($Title)) ; Reduce BlueStacks Memory Usage
	If _Sleep(1000) Then Return
	_CaptureRegion() ; Check Break Shield button again
	If _ColorCheck(_GetPixelColor(513, 416), Hex(0x5DAC10, 6), 50) Then
		Click(513, 416);Click Okay To Break Shield
	EndIf

	$AtkDeadEnabled = False
	$AtkAnyEnabled = False

	If GUICtrlRead($chkDeadGE) = $GUI_CHECKED Or GUICtrlRead($chkDeadMeetDE) = $GUI_CHECKED Or GUICtrlRead($chkDeadMeetTrophy) = $GUI_CHECKED Or GUICtrlRead($chkDeadMeetTH) = $GUI_CHECKED Or GUICtrlRead($chkDeadMeetTHO) = $GUI_CHECKED Then $AtkDeadEnabled = True
	If GUICtrlRead($chkMeetGE) = $GUI_CHECKED Or GUICtrlRead($chkMeetDE) = $GUI_CHECKED Or GUICtrlRead($chkMeetTrophy) = $GUI_CHECKED Or GUICtrlRead($chkMeetTH) = $GUI_CHECKED Or GUICtrlRead($chkMeetTHO) = $GUI_CHECKED Then $AtkAnyEnabled = True

	If Not $AtkDeadEnabled And Not $AtkAnyEnabled Then
		SetLog("~~~No search conditions enabled, deactivating attack mode~~~", $COLOR_RED)
		GUICtrlSetState($chkNoAttack, $GUI_CHECKED)
		chkNoAttack()
		Return
	EndIf

	While 1
	    If $AtkDeadEnabled Then SetLog("~Dead - Gold: " & $MinDeadGold & "; Elixir: " & $MinDeadElixir & "; Dark: " & $MinDeadDark & "; Trophy: " & $MinDeadTrophy & "; Townhall: " & $MaxDeadTH, $COLOR_GREEN)
  		If $AtkAnyEnabled Then SetLog("~Any  - Gold: " & $MinGold & "; Elixir: " & $MinElixir & "; Dark: " & $MinDark & "; Trophy: " & $MinTrophy & "; Townhall: " & $MaxTH, $COLOR_GREEN)
		If $TakeAllTownSnapShot = 1 Then SetLog("Will save all of the towns when searching", $COLOR_GREEN)
		$SearchCount = 0
	    _BlockInputEx(3, "", "", $HWnD)
		While 1
			If _Sleep(1000) Then ExitLoop (2)
		    GUICtrlSetState($btnAtkNow, $GUI_ENABLE)
			GetResources() ;Reads Resource Values

			If $Restart = True Then ExitLoop (2)

			If $TakeAllTownSnapShot = 1 Then
				Local $Date = @MDAY & "." & @MON & "." & @YEAR
				Local $Time = @HOUR & "." & @MIN & "." & @SEC
				_CaptureRegion()
				_GDIPlus_ImageSaveToFile($hBitmap, @ScriptDir & "\AllTowns\" & $Date & " at " & $Time & ".png")
			EndIf

			; read setting directly to allow speed change while searching to use attack now
			If _Sleep(_GUICtrlComboBox_GetCurSel($cmbSearchsp) * 1500) Then ExitLoop (2)

			; Attack instantly if Attack Now button pressed
			GUICtrlSetState($btnAtkNow, $GUI_DISABLE)
			If $AttackNow Then
				$AttackNow = False
				SetLog("~~~~~~~Attack Now Clicked!~~~~~~~", $COLOR_GREEN)
				ExitLoop
			EndIf

			If CompareResources() Then
				ExitLoop
			Else
			    _CaptureRegion()
				If _ColorCheck(_GetPixelColor(703, 520), Hex(0xD84400, 6), 20) Then
					Click(750, 500) ;Click Next
					$skippedVillages += 1
				ElseIf _ColorCheck(_GetPixelColor(71, 530), Hex(0xC00000, 6), 20) Then
					SetLog("Cannot locate Next button, try to return home...", $COLOR_RED)
					If _Sleep(500) Then Return
					ReturnHome(False) ;If End battle is available
					checkMainScreen()
					If _Sleep(1000) Then Return
					ZoomOut()
					If _Sleep(1000) Then Return
					checkMainScreen(False)
					If _Sleep(1000) Then Return
					PrepareSearch()
				Else
					SetLog("Cannot locate Next button & Surrender button, Restarting Bot", $COLOR_RED)
					checkMainScreen()
					$Restart = True
				    $DCattack = 1
					ExitLoop (2)
				EndIf
			EndIf
		WEnd

		If GUICtrlRead($chkAlertSearch) = $GUI_CHECKED Then
			TrayTip("Match Found!", "Gold: " & $searchGold & "; Elixir: " & $searchElixir & "; Dark: " & $searchDark & "; Trophy: " & $searchTrophy  & "; Townhall: " & $searchTH & ", " & $THLoc, 0)
			If FileExists(@WindowsDir & "\media\Windows Exclamation.wav") Then
			   SoundPlay(@WindowsDir & "\media\Windows Exclamation.wav", 1)
			Else
			   SoundPlay(@WindowsDir & "\media\Festival\Windows Exclamation.wav", 1)
			EndIf
	    EndIf
		GUICtrlSetData($lblresultvillagesskipped, GUICtrlRead($lblresultvillagesskipped)+ $skippedVillages)
		SetLog("===============Searching Complete===============", $COLOR_BLUE)
		readConfig()
		_BlockInputEx(0, "", "", $HWnD)
		ExitLoop
	WEnd
EndFunc   ;==>VillageSearch