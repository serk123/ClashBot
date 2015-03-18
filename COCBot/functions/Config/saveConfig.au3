;Saves all of the GUI values to the config.

Func saveConfig() ;Saves the controls settings to the config
	;Search Settings------------------------------------------------------------------------
	;GB - Alter config options
	IniWrite($config, "search", "searchDeadGold", GUICtrlRead($txtDeadMinGold))
	IniWrite($config, "search", "searchDeadElixir", GUICtrlRead($txtDeadMinElixir))
	IniWrite($config, "search", "searchDeadDark", GUICtrlRead($txtDeadMinDarkElixir))
	IniWrite($config, "search", "searchDeadTrophy", GUICtrlRead($txtDeadMinTrophy))
	IniWrite($config, "search", "searchGold", GUICtrlRead($txtMinGold))
	IniWrite($config, "search", "searchElixir", GUICtrlRead($txtMinElixir))
	IniWrite($config, "search", "searchDark", GUICtrlRead($txtMinDarkElixir))
	IniWrite($config, "search", "searchTrophy", GUICtrlRead($txtMinTrophy))
	IniWrite($config, "search", "AnyAndOr", _GUICtrlComboBox_GetCurSel($cmbAny))
	IniWrite($config, "search", "DeadAndOr", _GUICtrlComboBox_GetCurSel($cmbDead))
	IniWrite($config, "search", "THLevel", _GUICtrlComboBox_GetCurSel($cmbTH))
	IniWrite($config, "search", "DeadTHLevel", _GUICtrlComboBox_GetCurSel($cmbDeadTH))

	;GB - Alter conditions
	If GUICtrlRead($chkDeadGE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadGoldElixir", 1)
	Else
		IniWrite($config, "search", "conditionDeadGoldElixir", 0)
	EndIf

	If GUICtrlRead($chkDeadMeetDE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadDark", 1)
	Else
		IniWrite($config, "search", "conditionDeadDark", 0)
	EndIf

	If GUICtrlRead($chkDeadMeetTrophy) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadTrophy", 1)
	Else
		IniWrite($config, "search", "conditionDeadTrophy", 0)
	EndIf

	If GUICtrlRead($chkDeadMeetTH) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadTHLevel", 1)
	Else
		IniWrite($config, "search", "conditionDeadTHLevel", 0)
	EndIf

	If GUICtrlRead($chkDeadMeetTHO) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadTHOutside", 1)
	Else
		IniWrite($config, "search", "conditionDeadTHOutside", 0)
	EndIf

	If GUICtrlRead($chkMeetGE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionGoldElixir", 1)
	Else
		IniWrite($config, "search", "conditionGoldElixir", 0)
	EndIf

	If GUICtrlRead($chkMeetDE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDark", 1)
	Else
		IniWrite($config, "search", "conditionDark", 0)
	EndIf

	If GUICtrlRead($chkMeetTrophy) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTrophy", 1)
	Else
		IniWrite($config, "search", "conditionTrophy", 0)
	EndIf

	If GUICtrlRead($chkMeetTH) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTHLevel", 1)
	Else
		IniWrite($config, "search", "conditionTHLevel", 0)
	EndIf

	If GUICtrlRead($chkMeetTHO) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTHOutside", 1)
	Else
		IniWrite($config, "search", "conditionTHOutside", 0)
	EndIf

	;GB - missing config
	If GUICtrlRead($chkAlertSearch) = $GUI_CHECKED Then
		IniWrite($config, "search", "AlertBaseFound", 1)
	Else
		IniWrite($config, "search", "AlertBaseFound", 0)
	EndIf

	If GUICtrlRead($chkTakeLootSS) = $GUI_CHECKED Then
		IniWrite($config, "search", "TakeLootSnapShot", 1)
	Else
		IniWrite($config, "search", "TakeLootSnapShot", 0)
	EndIf

	If GUICtrlRead($chkTakeTownSS) = $GUI_CHECKED Then
		IniWrite($config, "search", "TakeAllTownSnapShot", 1)
	Else
		IniWrite($config, "search", "TakeAllTownSnapShot", 0)
	EndIf

	;Attack Settings-------------------------------------------------------------------------
    IniWrite($config, "other", "UnitD", _GUICtrlComboBox_GetCurSel($cmbUnitDelay))
	IniWrite($config, "other", "WaveD", _GUICtrlComboBox_GetCurSel($cmbWaveDelay))
	IniWrite($config, "other", "randomatk", GUICtrlRead($Randomspeedatk))
    ;GB - redo attack configs
	IniWrite($config, "attack", "deploy-dead", _GUICtrlComboBox_GetCurSel($cmbDeadDeploy))
	IniWrite($config, "attack", "algorithm-dead", _GUICtrlComboBox_GetCurSel($cmbDeadAlgorithm))

	If GUICtrlRead($chkDeadUseKing) = $GUI_CHECKED Then
		IniWrite($config, "attack", "king-dead", 1)
	Else
		IniWrite($config, "attack", "king-dead", 0)
	EndIf

	If GUICtrlRead($chkDeadUseQueen) = $GUI_CHECKED Then
		IniWrite($config, "attack", "queen-dead", 1)
	Else
		IniWrite($config, "attack", "queen-dead", 0)
	EndIf

	If GUICtrlRead($chkDeadUseClanCastle) = $GUI_CHECKED Then
		IniWrite($config, "attack", "use-cc-dead", 1)
	Else
		IniWrite($config, "attack", "use-cc-dead", 0)
	EndIf

	If GUICtrlRead($chkDeadAttackTH) = $GUI_CHECKED Then
		IniWrite($config, "attack", "townhall-dead", 1)
	Else
		IniWrite($config, "attack", "townhall-dead", 0)
	EndIf

	IniWrite($config, "attack", "deploy", _GUICtrlComboBox_GetCurSel($cmbDeploy))
	IniWrite($config, "attack", "algorithm", _GUICtrlComboBox_GetCurSel($cmbAlgorithm))

	If GUICtrlRead($chkUseKing) = $GUI_CHECKED Then
		IniWrite($config, "attack", "king-all", 1)
	Else
		IniWrite($config, "attack", "king-all", 0)
	EndIf

	If GUICtrlRead($chkUseQueen) = $GUI_CHECKED Then
		IniWrite($config, "attack", "queen-all", 1)
	Else
		IniWrite($config, "attack", "queen-all", 0)
	EndIf

	If GUICtrlRead($chkUseClanCastle) = $GUI_CHECKED Then
		IniWrite($config, "attack", "use-cc", 1)
	Else
		IniWrite($config, "attack", "use-cc", 0)
	EndIf

	If GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
		IniWrite($config, "attack", "townhall", 1)
	Else
		IniWrite($config, "attack", "townhall", 0)
	EndIf
	;Donate Settings-------------------------------------------------------------------------
	If GUICtrlRead($chkRequest) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkRequest", 1)
	Else
		IniWrite($config, "donate", "chkRequest", 0)
	EndIf
	;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	If GUICtrlRead($chkDonateAllBarbarians) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllBarbarians", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllBarbarians", 0)
	EndIf

	If GUICtrlRead($chkDonateAllArchers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllArchers", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllArchers", 0)
	EndIf

	If GUICtrlRead($chkDonateAllGiants) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllGiants", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllGiants", 0)
	EndIf
	;```````````````````````````````````````````````
	If GUICtrlRead($chkDonateBarbarians) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateBarbarians", 1)
	Else
		IniWrite($config, "donate", "chkDonateBarbarians", 0)
	EndIf

	If GUICtrlRead($chkDonateArchers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateArchers", 1)
	Else
		IniWrite($config, "donate", "chkDonateArchers", 0)
	EndIf

	If GUICtrlRead($chkDonateGiants) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateGiants", 1)
	Else
		IniWrite($config, "donate", "chkDonateGiants", 0)
	EndIf

	IniWrite($config, "donate", "xCCPos", $CCPos[0])
	IniWrite($config, "donate", "yCCPos", $CCPos[1])

	IniWrite($config, "donate", "txtRequest", GUICtrlRead($txtRequest))

	IniWrite($config, "donate", "txtDonateBarbarians", StringReplace(GUICtrlRead($txtDonateBarbarians), @CRLF, "|"))
	IniWrite($config, "donate", "txtDonateArchers", StringReplace(GUICtrlRead($txtDonateArchers), @CRLF, "|"))
	IniWrite($config, "donate", "txtDonateGiants", StringReplace(GUICtrlRead($txtDonateGiants), @CRLF, "|"))
	;Troop Settings--------------------------------------------------------------------------
	IniWrite($config, "troop", "raidcapacity", _GUICtrlComboBox_GetCurSel($cmbRaidcap))
	IniWrite($config, "troop", "composition", _GUICtrlComboBox_GetCurSel($cmbTroopComp))
	IniWrite($config, "troop", "capacity", GUICtrlRead($txtCapacity))
	If _GUICtrlComboBox_GetCurSel($cmbTroopComp) = 9 Then
		IniWrite($config, "troop", "barbarian", GUICtrlRead($txtBarbarians))
		IniWrite($config, "troop", "archer", GUICtrlRead($txtArchers))
		IniWrite($config, "troop", "goblin", GUICtrlRead($txtGoblins))
	EndIf
	IniWrite($config, "troop", "giant", GUICtrlRead($txtNumGiants))
	IniWrite($config, "troop", "WB", GUICtrlRead($txtNumWallbreakers))
	IniWrite($config, "troop", "troop1", _GUICtrlComboBox_GetCurSel($cmbBarrack1))
	IniWrite($config, "troop", "troop2", _GUICtrlComboBox_GetCurSel($cmbBarrack2))
	IniWrite($config, "troop", "troop3", _GUICtrlComboBox_GetCurSel($cmbBarrack3))
	IniWrite($config, "troop", "troop4", _GUICtrlComboBox_GetCurSel($cmbBarrack4))

   ;Other Settings--------------------------------------------------------------------------
	If GUICtrlRead($chkWalls) = $GUI_CHECKED Then
		IniWrite($config, "other", "auto-wall", 1)
	Else
		IniWrite($config, "other", "auto-wall", 0)
	EndIf
	IniWrite($config, "other", "walllvl", _GUICtrlComboBox_GetCurSel($cmbWalls))
	IniWrite($config, "other", "walltolerance", _GUICtrlComboBox_GetCurSel($cmbTolerance))

	If GUICtrlRead($UseGold) = $GUI_CHECKED Then
		IniWrite($config, "other", "use-storage", 0)
	ElseIf GUICtrlRead($UseElixir) = $GUI_CHECKED Then
		IniWrite($config, "other", "use-storage", 1)
	ElseIf GUICtrlRead($UseGoldElix) = $GUI_CHECKED Then
		IniWrite($config, "other", "use-storage", 2)
	EndIf

	IniWrite($config, "other", "minwallgold", GUICtrlRead($txtWallMinGold))
	IniWrite($config, "other", "minwallelixir", GUICtrlRead($txtWallMinElixir))
	;General Settings--------------------------------------------------------------------------
	Local $frmBotPos = WinGetPos($sBotTitle)
	IniWrite($config, "general", "frmBotPosX", $frmBotPos[0])
	IniWrite($config, "general", "frmBotPosY", $frmBotPos[1])
	IniWrite($config, "general", "MaxTrophy", GUICtrlRead($txtMaxTrophy))

	;Misc Settings--------------------------------------------------------------------------
	IniWrite($config, "misc", "reconnectdelay", GUICtrlRead($txtReconnect))
	IniWrite($config, "misc", "returnhomedelay", GUICtrlRead($txtReturnh))
	IniWrite($config, "misc", "kingskilldelay", GUICtrlRead($txtKingSkill))
	IniWrite($config, "misc", "queenskilldelay", GUICtrlRead($txtQueenSkill))
	IniWrite($config, "misc", "searchspd", _GUICtrlComboBox_GetCurSel($cmbSearchsp))
	IniWrite($config, "misc", "chkTrap", GUICtrlRead($chkTrap))
	IniWrite($config, "misc", "xTownHall", $TownHallPos[0])
	IniWrite($config, "misc", "yTownHall", $TownHallPos[1])
#cs
	;GB - Add buttons
	IniWrite($config, "misc", "xTrap", $TrapPos[0])
	IniWrite($config, "misc", "yTrap", $TrapPos[1])
	IniWrite($config, "misc", "xXbow", $XbowPos[0])
	IniWrite($config, "misc", "yXbow", $XbowPos[1])
	IniWrite($config, "misc", "xInferno", $InfernoPos[0])
	IniWrite($config, "misc", "yInferno", $InfernoPos[1])
#ce
    IniWrite($config, "misc", "xArmy", $ArmyPos[0])
	IniWrite($config, "misc", "yArmy", $ArmyPos[1])
    IniWrite($config, "misc", "xKing", $KingPos[0])
	IniWrite($config, "misc", "yKing", $KingPos[1])
    IniWrite($config, "misc", "xQueen", $QueenPos[0])
	IniWrite($config, "misc", "yQueen", $QueenPos[1])


	For $i = 0 To 3 ;Covers all 4 Barracks
		IniWrite($config, "troop", "xBarrack" & $i + 1, $barrackPos[$i][0])
		IniWrite($config, "troop", "yBarrack" & $i + 1, $barrackPos[$i][1])
	Next

	If GUICtrlRead($chkBackground) = $GUI_CHECKED Then
		IniWrite($config, "general", "Background", 1)
	Else
		IniWrite($config, "general", "Background", 0)
	EndIf

	If GUICtrlRead($chkBotStop) = $GUI_CHECKED Then
		IniWrite($config, "general", "BotStop", 1)
	Else
		IniWrite($config, "general", "BotStop", 0)
	EndIf

	If GUICtrlRead($chkForceBS) = $GUI_CHECKED Then
		IniWrite($config, "general", "ForceBS", 1)
	Else
		IniWrite($config, "general", "ForceBS", 0)
	EndIf

	;GB - Missing config
	If GUICtrlRead($chkNoAttack) = $GUI_CHECKED Then
		IniWrite($config, "general", "NoAttack", 1)
	Else
		IniWrite($config, "general", "NoAttack", 0)
	EndIf

	;GB - Missing config
	If GUICtrlRead($chkDonateOnly) = $GUI_CHECKED Then
		IniWrite($config, "general", "DonateOnly", 1)
	Else
		IniWrite($config, "general", "DonateOnly", 0)
	EndIf

	IniWrite($config, "general", "Command", _GUICtrlComboBox_GetCurSel($cmbBotCommand))
	IniWrite($config, "general", "Cond", _GUICtrlComboBox_GetCurSel($cmbBotCond))

	For $i = 0 To 16 ;Covers all Collectors
		IniWrite($config, "general", "xCollector" & $i + 1, $collectorPos[$i][0])
		IniWrite($config, "general", "yCollector" & $i + 1, $collectorPos[$i][1])
	Next
EndFunc   ;==>saveConfig