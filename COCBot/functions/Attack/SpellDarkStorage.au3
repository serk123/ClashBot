Func SpellDarkStorage()
    Local $SDark
	If $SpellDarkStorage = 0 Then Return
	    If $searchDark <> 0 Then $SDark = getDarkElixir(51, 66 + 57)
		If $SDark >= $itxtSpellDarkStorage Then

			$DELocation = checkDarkElix()
			If(($DELocation = 1) And ($LSpell <> -1 And $DElixx <> 0)) Then

			   SetLog("Found Dark Storage at PosX: " & $DElixx &", PosY: "& $DElixy &", activate Lightning Skill", $COLOR_BLUE)
			   Click(68 + (72 * $LSpell), 595) ;Select Spell
			   If _Sleep(500) Then Return
			   Click($DElixx, $DElixy)
			   If _Sleep(3000) Then Return
			ElseIf $LSpell = -1 Then
			   SetLog("Lightning Spell is not ready", $COLOR_RED)
			Else
			   SetLog("Unable to locate Dark Storage", $COLOR_RED)
			EndIf
		 Else
			SetLog("Dark Elixir do not meet min requirement", $COLOR_RED)
		 EndIf
	 	ClickP($TopLeftClient) ;Click Away
EndFunc   ;==>SpellDrakStorage