;Tries to zoom out of the screen until the borders, located at the top of the game (usually black), is located.

Func ZoomOut() ;Zooms out
	If _Sleep(500) Then Return
	_CaptureRegion(0, 0, 860, 2)
    If _GetPixelColor(1, 1) <> Hex(0x000000, 6) And _GetPixelColor(850, 1) <> Hex(0x000000, 6) Then SetLog("Zooming Out...", $COLOR_RED)
	While _GetPixelColor(1, 1) <> Hex(0x000000, 6) And _GetPixelColor(850, 1) <> Hex(0x000000, 6)
		ControlSend($Title, "", "", "{DOWN}", 0)
		If _Sleep(500) Then Return
		_CaptureRegion(0, 0, 860, 2)
	WEnd
EndFunc   ;==>ZoomOut