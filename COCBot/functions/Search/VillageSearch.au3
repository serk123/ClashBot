;Searches for a village that until meets conditions

Func VillageSearch($TakeSS = 0) ;Control for searching a village that meets conditions
   If _Sleep(1000) Then Return
   _CaptureRegion() ; Check Break Shield button again
   If _ColorCheck(_GetPixelColor(513, 416), Hex(0x5DAC10, 6), 50) Then
	  Click(513, 416);Click Okay To Break Shield
   EndIf
	While 1
		;GB - Not needed
		;Switch $iradAttackMode
		;	Case 0
		;		SetLog("============Searching For Dead Base============", $COLOR_BLUE)
		;	Case 1
		;		SetLog("============Searching For Weak Base============", $COLOR_BLUE)
		;	Case 2
		;		SetLog("============Searching For All Base============", $COLOR_BLUE)
		;EndSwitch
		SetLog("~Dead - Gold: " & $MinDeadGold & "; Elixir: " & $MinDeadElixir & "; Dark: " & $MinDeadDark & "; Trophy: " & $MinDeadTrophy & "; Townhall: " & $MaxDeadTH, $COLOR_GREEN) ;GB
		SetLog("~Any  - Gold: " & $MinGold & "; Elixir: " & $MinElixir & "; Dark: " & $MinDark & "; Trophy: " & $MinTrophy & "; Townhall: " & $MaxTH, $COLOR_GREEN)
		If $TakeSS = 1 Then SetLog("Will save all of the towns when searching", $COLOR_GREEN)
		$SearchCount = 0
		While 1
			;GB - Altering sleep locations to display camp stats earlier
			If _Sleep(1000) Then ExitLoop (2)
			GUICtrlSetState($btnAtkNow, $GUI_ENABLE) ;GB
			GetResources() ;Reads Resource Values
			If _Sleep(2000) Then ExitLoop (2)

			If $Restart = True Then ExitLoop (2)

			If $TakeSS = 1 Then
			   Local $Date = @MDAY & "." & @MON & "." & @YEAR
			   Local $Time = @HOUR & "." & @MIN & "." & @SEC
			   _CaptureRegion()
			   _GDIPlus_ImageSaveToFile($hBitmap, @ScriptDir & "\AllTowns\" & $Date & " at " & $Time & ".png")
			EndIf

			;GB - move delay to before checks to avoid inconsistencies
			If _Sleep($icmbSearchsp * 1500) Then ExitLoop (2)

			;GB - Attack instantly if Attack Now button pressed
			GUICtrlSetState($btnAtkNow, $GUI_DISABLE)
			If $AttackNow Then
			   $AttackNow = False
			   SetLog("~~~~~~~Attack Now Clicked!~~~~~~~", $COLOR_GREEN)
			   ExitLoop
			EndIf

			If CompareResources() Then
				ExitLoop
			Else
				If $CommandStop = 0 Then Return
				Click(750, 500) ;Click Next
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
		SetLog("===============Searching Complete===============", $COLOR_BLUE)
		readConfig()
		ExitLoop
	WEnd
EndFunc   ;==>VillageSearch