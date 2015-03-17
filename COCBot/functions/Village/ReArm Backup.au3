;==>ReArm
Func ReArm()
	; Re-arm Traps
	While 1
		If $TrapPos[0] = -1 Then
			SetLog("Trap position not set: re-arming disabled", $COLOR_RED)
			ExitLoop
		EndIf

		Click(1, 1)
		If _Sleep(1000) Then ExitLoop
		Click($TrapPos[0], $TrapPos[1])
		If _Sleep(1000) Then ExitLoop
		_CaptureRegion()
		$Rearm = _PixelSearch(446, 591, 604, 614, Hex(0xB2A79B, 6), 10)
		If IsArray($Rearm) Then
			Click($Rearm[0], $Rearm[1])
			If _Sleep(1000) Then Return
			_CaptureRegion()
			If _ColorCheck(_GetPixelColor(350, 420), Hex(0xC83B10, 6), 20) Then
				Click(515, 400)
				SetLog("All traps re-armed", $COLOR_GREEN)
			Else
				SetLog("All traps already armed", $COLOR_ORANGE)
			EndIf
			If _Sleep(500) Then ExitLoop
			Click(1, 1)
		Else
			SetLog("Traps not found", $COLOR_RED)
			If _Sleep(1000) Then Return
		EndIf
		ExitLoop
	 WEnd

	; Reload X-Bows
	While 1
		If $XbowPos[0] = -1 Then
			SetLog("X-Bow position not set: reloading disabled", $COLOR_RED)
			ExitLoop
		EndIf

		Click(1, 1)
		If _Sleep(1000) Then ExitLoop
		Click($XbowPos[0], $XbowPos[1])
		If _Sleep(1000) Then ExitLoop
		_CaptureRegion()
		$Rearm = _PixelSearch(575, 578, 652, 601, Hex(0x8A562D, 6), 10)
		If IsArray($Rearm) Then
			Click($Rearm[0], $Rearm[1])
			If _Sleep(1000) Then Return
			_CaptureRegion()
			If _ColorCheck(_GetPixelColor(350, 420), Hex(0xC83B10, 6), 20) Then
				Click(515, 400)
				SetLog("All X-Bows reloaded", $COLOR_GREEN)
			Else
				SetLog("All X-Bows already loaded", $COLOR_ORANGE)
			EndIf
			If _Sleep(500) Then ExitLoop
			Click(1, 1)
		Else
			SetLog("X-Bows not found", $COLOR_RED)
			If _Sleep(1000) Then Return
		EndIf
		ExitLoop
	WEnd

	; Reload Inferno Towers
	While 1
		If $InfernoPos[0] = -1 Then
			SetLog("Inferno Tower position not set: reloading disabled", $COLOR_RED)
			ExitLoop
		EndIf

		Click(1, 1)
		If _Sleep(1000) Then ExitLoop
		Click($InfernoPos[0], $InfernoPos[1])
		If _Sleep(1000) Then ExitLoop
		_CaptureRegion()
		$Rearm = _PixelSearch(575, 578, 652, 601, Hex(0xf8400c, 6), 10)
		If IsArray($Rearm) Then
			Click($Rearm[0], $Rearm[1])
			If _Sleep(1000) Then Return
			_CaptureRegion()
			If _ColorCheck(_GetPixelColor(350, 420), Hex(0xC83B10, 6), 20) Then
				Click(515, 400)
				SetLog("All Inferno Towers reloaded", $COLOR_GREEN)
			Else
				SetLog("All Inferno Towers already loaded", $COLOR_ORANGE)
			EndIf
			If _Sleep(500) Then ExitLoop
			Click(1, 1)
		Else
			SetLog("Inferno Towers not found", $COLOR_RED)
			If _Sleep(1000) Then Return
		EndIf
		ExitLoop
	WEnd

	; Added to avoid text across army camps when checking troop capacity
	If _Sleep(500) Then Return
EndFunc   ;==>ReArm