;Uses the location of manually set Barracks to train specified troops

; Train the troops (Fill the barracks)

Func GetTrainPos($troopKind)
   Switch $troopKind
   Case $eBarbarian ; 261, 366: 0x39D8E0
	  Return $TrainBarbarian
   Case $eArcher ; 369, 366: 0x39D8E0
	  Return $TrainArcher
   Case $eGiant ; 475, 366: 0x3DD8E0
	  Return $TrainGiant
   Case $eGoblin ; 581, 366: 0x39D8E0
	  Return $TrainGoblin
   Case $eWallbreaker ; 688, 366, 0x3AD8E0
	  Return $TrainWallbreaker
   Case Else
	  SetLog("Don't know how to train the troop " & $troopKind & " yet")
	  Return 0
   EndSwitch
EndFunc

Func TrainIt($troopKind, $howMuch = 1, $iSleep = 100)
   _CaptureRegion()
   Local $pos = GetTrainPos($troopKind)
   If IsArray($pos) Then
	  If CheckPixel($pos) Then
		 ClickP($pos, $howMuch, 20)
		 if _Sleep($iSleep) Then Return False
		 Return True
	  EndIf
   EndIf
EndFunc

Func Train()
 	If $fullArmy Then
    SetLog("Army Camp Full : " & $fullArmy, $COLOR_RED)
    EndIf

	If $barrackPos[0][0] = "" Then
		LocateBarrack()
		SaveConfig()
		If _Sleep(2000) Then Return
    EndIf

	SetLog("Training Troops...", $COLOR_BLUE)

	If $fullArmy Then ; reset all for cook again ;GB - Fix training incorrect troops on startup
	 $ArmyComp = 0
	 $CurGiant = 0
	 $CurWB = 0
	 $CurArch = 0
	 $CurBarb = 0
	 $CurGoblin = 0
	Endif

	If $ArmyComp = 0 Then
		$CurGiant += GUICtrlRead($txtNumGiants)
		$CurWB += GUICtrlRead($txtNumWallbreakers)
		$CurArch += (($itxtcampCap * ((GUICtrlRead($cmbRaidcap)+5) / 100))-(GUICtrlRead($txtNumGiants)*5)-(GUICtrlRead($txtNumWallbreakers)*2))*GUICtrlRead($txtArchers)/100
		$CurArch = Round($CurArch) + 4; ===> make sure always cook full
		$CurBarb += (($itxtcampCap * ((GUICtrlRead($cmbRaidcap)+5) / 100))-(GUICtrlRead($txtNumGiants)*5)-(GUICtrlRead($txtNumWallbreakers)*2))*GUICtrlRead($txtBarbarians)/100
		$CurBarb = Round($CurBarb)
		$CurGoblin += (($itxtcampCap * ((GUICtrlRead($cmbRaidcap)+5) / 100))-(GUICtrlRead($txtNumGiants)*5)-(GUICtrlRead($txtNumWallbreakers)*2))*GUICtrlRead($txtGoblins)/100
		$CurGoblin = Round($CurGoblin)
	EndIf

	Local $GiantEBarrack ,$WallEBarrack ,$ArchEBarrack ,$BarbEBarrack ,$GoblinEBarrack
	$GiantEBarrack = Floor($CurGiant/4)
	$WallEBarrack = Floor($CurWB/4)
	$ArchEBarrack = Floor($CurArch/4)
	$BarbEBarrack = Floor($CurBarb/4)
	$GoblinEBarrack = Floor($CurGoblin/4)

	Local $troopFirstGiant,$troopSecondGiant,$troopFirstWall,$troopSecondWall,$troopFirstGoblin,$troopSecondGoblin,$troopFirstBarba,$troopSecondBarba,$troopFirstArch,$troopSecondArch
	$troopFirstGiant = 0
	$troopSecondGiant = 0
	$troopFirstWall = 0
	$troopSecondWall = 0
	$troopFirstGoblin = 0
	$troopSecondGoblin = 0
	$troopFirstBarba = 0
	$troopSecondBarba = 0
	$troopFirstArch = 0
	$troopSecondArch = 0

	For $i = 0 To 3
		If _Sleep(500) Then ExitLoop

		ClickP($TopLeftClient) ;Click Away

		If _Sleep(500) Then ExitLoop

		Click($barrackPos[$i][0], $barrackPos[$i][1]) ;Click Barrack
		If _Sleep(500) Then ExitLoop

		Local $TrainPos = _PixelSearch(155, 603, 694, 605, Hex(0x603818, 6), 5) ;Finds Train Troops button
		If IsArray($TrainPos) = False Then
			SetLog("Barrack " & $i + 1 & " is not available", $COLOR_RED)
			If _Sleep(500) Then ExitLoop
		Else
			Click($TrainPos[0], $TrainPos[1]) ;Click Train Troops button
			;SetLog("Barrack " & $i + 1 & " ...", $COLOR_GREEN)
			If _Sleep(1000) Then ExitLoop

			If _GUICtrlComboBox_GetCurSel($cmbTroopComp) = 8 Then
				_CaptureRegion()
				Switch $barrackTroop[$i]
					Case 0
						While _ColorCheck(_GetPixelColor(329, 297), Hex(0xDC3F70, 6), 20)
							Click(220, 320, 30) ;Barbarian
							If _Sleep(50) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 1
						While _ColorCheck(_GetPixelColor(217, 297), Hex(0xF8AD20, 6), 20)
							Click(331, 320, 30) ;Archer
							If _Sleep(50) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 2
						While _ColorCheck(_GetPixelColor(217, 297), Hex(0xF8AD20, 6), 20)
							Click(432, 320, 20) ;Giant
							If _Sleep(50) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 3
						While _ColorCheck(_GetPixelColor(217, 297), Hex(0xF8AD20, 6), 20)
							Click(546, 320, 30) ;Goblin
							If _Sleep(50) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 4
						While _ColorCheck(_GetPixelColor(648, 289), Hex(0x62C8D8, 6), 20)
							Click(647, 320, 15) ;Wall Breaker
							If _Sleep(50) Then ExitLoop
							_CaptureRegion()
						 WEnd
					Case 5
						While _ColorCheck(_GetPixelColor(182, 422), Hex(0x48B3CB, 6), 20)
							Click(220, 430, 15) ;Balloon
							If _Sleep(50) Then ExitLoop
							_CaptureRegion()
						 WEnd
					Case 6
						While _ColorCheck(_GetPixelColor(289, 407), Hex(0x58C4D8, 6), 20)
							Click(331, 430, 15) ;Wizard
							If _Sleep(50) Then ExitLoop
							_CaptureRegion()
						 WEnd
					Case 7
						While _ColorCheck(_GetPixelColor(395, 403), Hex(0x60C6D8, 6), 20)
							Click(432, 430, 15) ;Healer
							If _Sleep(50) Then ExitLoop
							_CaptureRegion()
						 WEnd
					Case 8
						While _ColorCheck(_GetPixelColor(508, 403), Hex(0x60C4D8, 6), 20)
							Click(546, 430, 15) ;Dragon
							If _Sleep(50) Then ExitLoop
							_CaptureRegion()
						 WEnd
					Case 9
							If _Sleep(50) Then ExitLoop
							_CaptureRegion()
				EndSwitch
			Else
				  SetLog("====== Barrack " & $i + 1 & " : ======", $COLOR_BLUE)
			_CaptureRegion()
			;while _ColorCheck(_GetPixelColor(496, 200), Hex(0x880000, 6), 20) Then
			if $fullArmy or $FirstStart then
				 Click(496, 190, 80,5)
			endif
			;wend

		   If _Sleep(500) Then ExitLoop
		   _CaptureRegion()
		   If GUICtrlRead($txtNumGiants) <> "0" Then
			  $troopFirstGiant = Number(getOther(171 + 107 * 2, 278, "Barrack"))
			  if $troopFirstGiant = 0 then
				  $troopFirstGiant = Number(getOther(171 + 107 * 2, 278, "Barrack"))
			  endif
		   Endif

		   If GUICtrlRead($txtNumWallbreakers) <> "0" then
			  $troopFirstWall = Number(getOther(171 + 107 * 4, 278, "Barrack"))
			  if $troopFirstWall = 0 then
				  $troopFirstWall = Number(getOther(171 + 107 * 4, 278, "Barrack"))
			  endif
		   EndIf

          If GUICtrlRead($txtGoblins) <> "0" then
			  $troopFirstGoblin = Number(getOther(171 + 107 * 3, 278, "Barrack"))
			  if $troopFirstGoblin = 0 then
				  $troopFirstGoblin = Number(getOther(171 + 107 * 3, 278, "Barrack"))
			  endif
		   EndIf

		  If GUICtrlRead($txtBarbarians) <> "0" then
			  $troopFirstBarba = Number(getOther(171 + 107 * 0, 278, "Barrack"))
			  if $troopFirstBarba = 0 then
				  $troopFirstBarba = Number(getOther(171 + 107 * 0, 278, "Barrack"))
			  endif
		   EndIf

		  If GUICtrlRead($txtArchers) <> "0" Then
			  $troopFirstArch = Number(getOther(171 + 107 * 1, 278, "Barrack"))
			  if $troopFirstArch = 0 then
				  $troopFirstArch = Number(getOther(171 + 107 * 1, 278, "Barrack"))
			  endif
		   Endif

		   If GUICtrlRead($txtArchers) <> "0" And $CurArch > 0 Then
			   ;If _ColorCheck(_GetPixelColor(261, 366), Hex(0x39D8E0, 6), 20) And $CurArch > 0 Then
			   If $CurArch > 0  Then
					if $ArchEBarrack = 0 then
					    TrainIt($eArcher, 1)
					elseif $ArchEBarrack >= $CurArch then
					    TrainIt($eArcher, $CurArch)
				    else
					    TrainIt($eArcher, $ArchEBarrack)
				    endif
			   EndIf
		   EndIf

		   If GUICtrlRead($txtNumGiants) <> "0" And $CurGiant > 0 Then
			   ;If _ColorCheck(_GetPixelColor(475, 366), Hex(0x3DD8E0, 6), 20) And $CurGiant > 0 Then
			   If $CurGiant > 0 Then
				   if $GiantEBarrack = 0 then
					    TrainIt($eGiant, 1)
					elseif $GiantEBarrack >= $CurGiant or $GiantEBarrack = 0  then
					   TrainIt($eGiant, $CurGiant)
				   else
					   TrainIt($eGiant, $GiantEBarrack)
				   endif
			   endif
		   EndIf


		   If GUICtrlRead($txtNumWallbreakers) <> "0" And $CurWB > 0 Then
			   ;If _ColorCheck(_GetPixelColor(688, 366), Hex(0x3AD8E0, 6), 20) And $CurWB > 0  Then
			   If $CurWB > 0  Then
				   if $WallEBarrack = 0 then
					    TrainIt($eWallbreaker, 1)
					elseif $WallEBarrack >= $CurWB or $WallEBarrack = 0  then
					   TrainIt($eWallbreaker, $CurWB)
				   else
					   TrainIt($eWallbreaker, $WallEBarrack)
				   endif
			   EndIf
		   EndIf


		   If GUICtrlRead($txtBarbarians) <> "0" And $CurBarb > 0 Then
			   ;If _ColorCheck(_GetPixelColor(369, 366), Hex(0x39D8E0, 6), 20) And $CurBarb > 0 Then
			   If $CurBarb > 0  Then
				   if $BarbEBarrack = 0 then
					    TrainIt($eBarbarian, 1)
					elseif $BarbEBarrack >= $CurBarb or $BarbEBarrack = 0  then
					   TrainIt($eBarbarian, $CurBarb)
				   else
					   TrainIt($eBarbarian, $BarbEBarrack)
				   endif
			   EndIf
		   EndIf


		   If GUICtrlRead($txtGoblins) <> "0" And $CurGoblin > 0 Then
			   ;If _ColorCheck(_GetPixelColor(261, 366), Hex(0x39D8E0, 6), 20) And $CurGoblin > 0 Then
			   If $CurGoblin > 0  Then
				   if $GoblinEBarrack = 0 then
					    TrainIt($eGoblin, 1)
					elseif $GoblinEBarrack >= $CurGoblin or $GoblinEBarrack = 0  then
					   TrainIt($eGoblin, $CurGoblin)
				   else
					   TrainIt($eGoblin, $GoblinEBarrack)
				   endif
			   EndIf
		   EndIf


			 If _Sleep(900) Then ExitLoop
		   _CaptureRegion()
		   If GUICtrlRead($txtNumGiants) <> "0" Then
			  $troopSecondGiant = Number(getOther(171 + 107 * 2, 278, "Barrack"))
			  if $troopSecondGiant = 0 then
				  $troopSecondGiant = Number(getOther(171 + 107 * 2, 278, "Barrack"))
			   endif
			EndIf

		  If GUICtrlRead($txtNumWallbreakers) <> "0" then
			  $troopSecondWall = Number(getOther(171 + 107 * 4, 278, "Barrack"))
			  if $troopSecondWall = 0 then
				  $troopSecondWall = Number(getOther(171 + 107 * 4, 278, "Barrack"))
			   endif
			EndIf

		  If GUICtrlRead($txtGoblins) <> "0" then
			  $troopSecondGoblin = Number(getOther(171 + 107 * 3, 278, "Barrack"))
			  if $troopSecondGoblin = 0 then
				  $troopSecondGoblin = Number(getOther(171 + 107 * 3, 278, "Barrack"))
			   endif
			EndIf

		  If GUICtrlRead($txtBarbarians) <> "0" then
			  $troopSecondBarba = Number(getOther(171 + 107 * 0, 278, "Barrack"))
			  if $troopSecondBarba = 0 then
				  $troopSecondBarba = Number(getOther(171 + 107 * 0, 278, "Barrack"))
			   endif
		   EndIf

		  If GUICtrlRead($txtArchers) <> "0" Then
			  $troopSecondArch = Number(getOther(171 + 107 * 1, 278, "Barrack"))
			  if $troopSecondArch = 0 then
				  $troopSecondArch = Number(getOther(171 + 107 * 1, 278, "Barrack"))
			  endif
		   EndIf


		   if $troopSecondGiant > $troopFirstGiant and GUICtrlRead($txtNumGiants) <> "0" then
			   $ArmyComp += ($troopSecondGiant - $troopFirstGiant)*5
			   $CurGiant -= ($troopSecondGiant - $troopFirstGiant)
			   SetLog("Barrack " & ($i+1) & " Training Giant : " & ($troopSecondGiant - $troopFirstGiant) , $COLOR_GREEN)
			   SetLog("Giant Remaining : " & $CurGiant , $COLOR_BLUE)
		   endif


		   if $troopSecondWall > $troopFirstWall and GUICtrlRead($txtNumWallbreakers) <> "0" then
			   $ArmyComp += ($troopSecondWall - $troopFirstWall)*2
			   $CurWB -= ($troopSecondWall - $troopFirstWall)
			   SetLog("Barrack " & ($i+1) & " Training WallBreaker : " & ($troopSecondWall - $troopFirstWall) , $COLOR_GREEN)
			   SetLog("WallBreaker Remaining : " & $CurWB , $COLOR_BLUE)
		   endif

		   if $troopSecondGoblin > $troopFirstGoblin and GUICtrlRead($txtGoblins) <> "0" then
			   $ArmyComp += ($troopSecondGoblin - $troopFirstGoblin)
			   $CurGoblin -= ($troopSecondGoblin - $troopFirstGoblin)
			   SetLog("Barrack " & ($i+1) & " Training Goblin : " & ($troopSecondGoblin - $troopFirstGoblin) , $COLOR_GREEN)
			   SetLog("Goblin Remaining : " & $CurGoblin , $COLOR_BLUE)
		   endif

		   if $troopSecondBarba > $troopFirstBarba and GUICtrlRead($txtBarbarians) <> "0" then
			   $ArmyComp += ($troopSecondBarba - $troopFirstBarba)
			   $CurBarb -= ($troopSecondBarba - $troopFirstBarba)
			   SetLog("Barrack " & ($i+1) & " Training Barbarian : " & ($troopSecondBarba - $troopFirstBarba) , $COLOR_GREEN)
			   SetLog("Barbarian Remaining : " & $CurBarb , $COLOR_BLUE)
		   endif

		   if $troopSecondArch > $troopFirstArch and GUICtrlRead($txtArchers) <> "0" then
			   $ArmyComp += ($troopSecondArch - $troopFirstArch)
			   $CurArch -= ($troopSecondArch - $troopFirstArch)
			   SetLog("Barrack " & ($i+1) & " Training Archer : " & ($troopSecondArch - $troopFirstArch) , $COLOR_GREEN)
			   SetLog("Archer Remaining : " & $CurArch , $COLOR_BLUE)
		   endif
		   SetLog("Total Troops building : " & $ArmyComp , $COLOR_RED)
	  Endif
   Endif
    If _Sleep(100) Then ExitLoop
	Click($TopLeftClient[0], $TopLeftClient[1], 2, 250); Click away twice with 250ms delay
 Next
    SetLog("Training Troops Complete...", $COLOR_BLUE)
    $FirstStart = false
 EndFunc   ;==>Train