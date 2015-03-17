;Reads config file and sets variables

Func readConfig() ;Reads config and sets it to the variables
	If FileExists($config) Then
		;Search Settings------------------------------------------------------------------------
		;GB - Add dead configs
		$MinDeadGold = IniRead($config, "search", "searchDeadGold", "50000")
		$MinDeadElixir = IniRead($config, "search", "searchDeadElixir", "50000")
		$MinDeadDark = IniRead($config, "search", "searchDeadDark", "0")
		$MinDeadTrophy = IniRead($config, "search", "searchDeadTrophy", "0")
		$MinGold = IniRead($config, "search", "searchGold", "80000")
		$MinElixir = IniRead($config, "search", "searchElixir", "80000")
		$MinDark = IniRead($config, "search", "searchDark", "0")
		$MinTrophy = IniRead($config, "search", "searchTrophy", "0")
		$icmbAny = IniRead($config, "search", "AnyAndOr", "0")
		$icmbDead = IniRead($config, "search", "DeadAndOr", "0")
		$icmbTH = IniRead($config, "search", "THLevel", "0")
		$icmbDeadTH = IniRead($config, "search", "DeadTHLevel", "0")

		$chkConditions[0] = IniRead($config, "search", "conditionDeadGoldElixir", "0")
		$chkConditions[1] = IniRead($config, "search", "conditionDeadDark", "0")
		$chkConditions[2] = IniRead($config, "search", "conditionDeadTrophy", "0")
		$chkConditions[3] = IniRead($config, "search", "conditionDeadTHLevel", "0")
		$chkConditions[4] = IniRead($config, "search", "conditionDeadTHOutside", "0")
		$chkConditions[5] = IniRead($config, "search", "conditionGoldElixir", "0")
		$chkConditions[6] = IniRead($config, "search", "conditionDark", "0")
		$chkConditions[7] = IniRead($config, "search", "conditionTrophy", "0")
		$chkConditions[8] = IniRead($config, "search", "conditionTHLevel", "0")
		$chkConditions[9] = IniRead($config, "search", "conditionTHOutside", "0")

		;GB - missing config
		$AlertBaseFound = IniRead($config, "search", "AlertBaseFound", "0")
		$TakeLootSnapShot = IniRead($config, "search", "TakeLootSnapShot", "0")
		$TakeAllTownSnapShot = IniRead($config, "search", "TakeAllTownSnapShot", "0")
		;Attack Settings-------------------------------------------------------------------------
		;GB - redo attack configs
		$deployDeadSettings = IniRead($config, "attack", "deploy-dead", "0")
		$icmbDeadAlgorithm = IniRead($config, "attack", "algorithm-dead", "0")
		$checkDeadUseKing = IniRead($config, "attack", "king-dead", "0")
		$checkDeadUseQueen = IniRead($config, "attack", "queen-dead", "0")
		$checkDeadUseClanCastle = IniRead($config, "attack", "use-cc-dead", "0")
		$checkDeadAttackTH = IniRead($config, "attack", "townhall-dead", "0")
		$deploySettings = IniRead($config, "attack", "deploy", "0")
		$icmbAlgorithm = IniRead($config, "attack", "algorithm", "0")
		$checkUseKing = IniRead($config, "attack", "king-all", "0")
		$checkUseQueen = IniRead($config, "attack", "queen-all", "0")
		$checkUseClanCastle = IniRead($config, "attack", "use-cc", "0")
		$checkAttackTH = IniRead($config, "attack", "townhall", "0")
		;Donate Settings-------------------------------------------------------------------------
		$CCPos[0] = IniRead($config, "donate", "xCCPos", "0")
		$CCPos[1] = IniRead($config, "donate", "yCCPos", "0")

		$ichkRequest = IniRead($config, "donate", "chkRequest", "0")
		$itxtRequest = IniRead($config, "donate", "txtRequest", "")

		$ichkDonateBarbarians = IniRead($config, "donate", "chkDonateBarbarians", "0")
		$ichkDonateAllBarbarians = IniRead($config, "donate", "chkDonateAllBarbarians", "0")
		$itxtDonateBarbarians = StringReplace(IniRead($config, "donate", "txtDonateBarbarians", "barbarians|barb|any"), "|", @CRLF)

		$ichkDonateArchers = IniRead($config, "donate", "chkDonateArchers", "0")
		$ichkDonateAllArchers = IniRead($config, "donate", "chkDonateAllArchers", "0")
		$itxtDonateArchers = StringReplace(IniRead($config, "donate", "txtDonateArchers", "archers|arch|any"), "|", @CRLF)

		$ichkDonateGiants = IniRead($config, "donate", "chkDonateGiants", "0")
		$ichkDonateAllGiants = IniRead($config, "donate", "chkDonateAllGiants", "0")
		$itxtDonateGiants = StringReplace(IniRead($config, "donate", "txtDonateGiants", "giants|giant|any"), "|", @CRLF)
		;Troop Settings--------------------------------------------------------------------------
		$icmbRaidcap = IniRead($config, "troop", "raidcapacity", "0")
		$icmbTroopComp = IniRead($config, "troop", "composition", "0")
		$itxtcampCap = IniRead($config, "troop", "capacity", "0")
		$BarbariansComp = IniRead($config, "troop", "barbarian", "0")
		$ArchersComp = IniRead($config, "troop", "archer", "0")
		$GiantsComp = IniRead($config, "troop", "giant", "0")
		$GoblinsComp = IniRead($config, "troop", "goblin", "0")
		$WBComp = IniRead($config, "troop", "WB", "0")

		;GB - New functions
		$TrapPos[0] = IniRead($config, "troop", "xTrap", "-1")
		$TrapPos[1] = IniRead($config, "troop", "yTrap", "-1")
		$XbowPos[0] = IniRead($config, "troop", "xXbow", "-1")
		$XbowPos[1] = IniRead($config, "troop", "yXbow", "-1")
		$InfernoPos[0] = IniRead($config, "troop", "xInferno", "-1")
		$InfernoPos[1] = IniRead($config, "troop", "yInferno", "-1")
		$ArmyPos[0] = IniRead($config, "troop", "xArmy", "0")
		$ArmyPos[1] = IniRead($config, "troop", "yArmy", "0")

		For $i = 0 To 3 ;Covers all 4 Barracks
			$barrackPos[$i][0] = IniRead($config, "troop", "xBarrack" & $i + 1, "0")
			$barrackPos[$i][1] = IniRead($config, "troop", "yBarrack" & $i + 1, "0")
			$barrackTroop[$i] = IniRead($config, "troop", "troop" & $i + 1, "0")
		Next
	Else
		Return False
	EndIf
	;General Settings--------------------------------------------------------------------------
	$frmBotPosX = IniRead($config, "general", "frmBotPosX", "207")
	$frmBotPosY = IniRead($config, "general", "frmBotPosY", "158")
	$itxtMaxTrophy = IniRead($config, "general", "MaxTrophy", "3000")
	$ichkBackground = IniRead($config, "general", "Background", "0")
	$ichkBotStop = IniRead($config, "general", "BotStop", "0")
	$icmbBotCommand = IniRead($config, "general", "Command", "0")
	$icmbBotCond = IniRead($config, "general", "Cond", "0")
	$ichkForceBS = IniRead($config, "general", "ForceBS", "0")
	$ichkNoAttack = IniRead($config, "general", "NoAttack", "0") ;GB - missing config
	$ichkDonateOnly = IniRead($config, "general", "DonateOnly", "0") ;GB - missing config

	;Misc Settings--------------------------------------------------------------------------
	$itxtReconnect = IniRead($config, "misc", "reconnectdelay", "0")
	$itxtReturnh = IniRead($config, "misc", "returnhomedelay", "0")
	$attackpattern = IniRead($config, "misc", "apattern", "0")
	$icmbSearchsp = IniRead($config, "misc", "searchspd", "0")

	For $i = 0 To 16 ;Covers all Collectors
		$collectorPos[$i][0] = IniRead($config, "general", "xCollector" & $i + 1, "0")
		$collectorPos[$i][1] = IniRead($config, "general", "yCollector" & $i + 1, "0")
	 Next
EndFunc   ;==>readConfig