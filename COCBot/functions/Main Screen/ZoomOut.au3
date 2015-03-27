;Tries to zoom out of the screen until the borders, located at the top of the game (usually black), is located.

Func ZoomOut2() ;Zooms out
	Local $i = 0
	While 1
		_CaptureRegion(0, 0, 860, 2)
		If _GetPixelColor(1, 1) <> Hex(0x000000, 6) And _GetPixelColor(850, 1) <> Hex(0x000000, 6) Then SetLog("Zooming Out", $COLOR_BLUE)
		While _GetPixelColor(1, 1) <> Hex(0x000000, 6) And _GetPixelColor(850, 1) <> Hex(0x000000, 6)
			If _Sleep(600) Then Return
			If ControlSend($Title, "", "", "{DOWN}") Then $i += 1
			If $i = 30 Then
				ExitLoop
			EndIf
			_CaptureRegion(0, 0, 860, 2)
		 WEnd
		ExitLoop
	WEnd
 EndFunc   ;==>ZoomOut

 ;Only does it for 30 zoom outs, no more than that.
Func ZoomOut() ;Zooms out Control
    If _GetPixelColor(394, 37) <> Hex(0x488B00, 6) Then checkMainScreen(False)
	Local $i = 0
	While 1
		_CaptureRegion()
		If _GetPixelColor(409, 10) <> Hex(0x986E32, 6) And _GetPixelColor(850, 319) <> Hex(0x5A461E, 6) Then SetLog("Zooming Out", $COLOR_BLUE)
		While _GetPixelColor(409, 10) <> Hex(0x986E32, 6) And _GetPixelColor(850, 319) <> Hex(0x5A461E, 6)
			If _Sleep(600) Then Return
			If ControlSend($Title, "", "", "{DOWN}") Then $i += 1
			If $i = 30 Then
				ExitLoop
			EndIf
			_CaptureRegion()
		 WEnd
		ExitLoop
	WEnd
 EndFunc   ;==>ZoomOut

 Func ZoomOut10() ;Zooms out
    If _GetPixelColor(394, 37) <> Hex(0x488B00, 6) Then checkMainScreen(False)
	Local $i = 0
	While 1
		_CaptureRegion()
		If _GetPixelColor(409, 10) <> Hex(0x986E32, 6) And _GetPixelColor(850, 319) <> Hex(0x5A461E, 6) Then SetLog("Zooming Out", $COLOR_BLUE)
		While _GetPixelColor(409, 10) <> Hex(0x986E32, 6) And _GetPixelColor(850, 319) <> Hex(0x5A461E, 6)
			If _Sleep(600) Then Return
			If ControlSend($Title, "", "", "{DOWN}") Then $i += 1
			If $i = 10 Then
				ExitLoop
			EndIf
			_CaptureRegion()
		 WEnd
		ExitLoop
	WEnd
EndFunc   ;==>ZoomOutControl