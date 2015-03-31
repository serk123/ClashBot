Func VillageReport()
	ClickP($TopLeftClient) ;Click Away
	If _Sleep(500) Then Return

	SetLog("Village Report", $COLOR_GREEN)

	$FreeBuilder = GetOther(324, 23, "Builder")
	Setlog("Num. of Free Builders: " & $FreeBuilder, $COLOR_GREEN)
	$TrophyCount = getOther(50, 74, "Trophy")

	SetLog("Opening Builder page to read Resources..", $COLOR_BLUE)
	Click(388, 30) ; Click Builder Button
	_CaptureRegion()
	Local $i = 0
	_WaitForPixel(819, 39, Hex(0xF8FCFF, 6), 20, 10000, 200)
	If _ColorCheck(_GetPixelColor(318, 637), Hex(0xD854D0, 6), 20) Then
		$GoldCount = GetOther(356, 625, "Resource")
		$ElixirCount = GetOther(195, 625, "Resource")
		$GemCount = GetOther(543, 625, "Gems")
		SetLog("Resources: [G]: " & $GoldCount & " [E]: " & $ElixirCount & " [GEM]: " & $GemCount, $COLOR_GREEN)
	Else
		$GoldCount = GetOther(440, 625, "Resource")
		$ElixirCount = GetOther(282, 625, "Resource")
		$DarkCount = GetOther(125, 625, "Resource")
		$GemCount = GetOther(606, 625, "Gems")
		SetLog("Resources: [G]: " & $GoldCount & " [E]: " & $ElixirCount & " [D]: " & $DarkCount & " [GEM]: " & $GemCount, $COLOR_GREEN)
	EndIf
	Click(820, 40) ; Close Builder/Shop
	If $FirstAttack = 0 Then
		GUICtrlSetData($lblresultgoldtstart, $GoldCount)
		GUICtrlSetData($lblresultelixirstart, $ElixirCount)
		GUICtrlSetData($lblresultdestart, $DarkCount)
		GUICtrlSetData($lblresulttrophystart, $TrophyCount)
		$BuilderCountStart = $FreeBuilder
	Else
		If GUICtrlRead($lblpushbulletenabled) = $GUI_CHECKED and GUICtrlRead($lblfreebuilder) = $GUI_CHECKED Then
			If $FreeBuilder > $BuilderCountStart Then
				_Push("Free Builder Available", "You have a free builder available")
				SetLog("You have a free builder available")
			EndIf
		EndIf
	EndIf
	GUICtrlSetData($lblresultgoldnow, $GoldCount)
	GUICtrlSetData($lblresultelixirnow, $ElixirCount)
	GUICtrlSetData($lblresultdenow, $DarkCount)
	GUICtrlSetData($lblresulttrophynow, $TrophyCount)

	GUICtrlSetData($lblresultgoldnowM, $GoldCount)
	GUICtrlSetData($lblresultelixirnowM, $ElixirCount)
	GUICtrlSetData($lblresultdenowM, $DarkCount)
	$FirstAttack = 1
EndFunc   ;==>VillageReport
