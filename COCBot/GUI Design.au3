$frmBot = GUICreate($sBotTitle, 417, 430, 207, 158)
GUISetIcon(@ScriptDir & "\Icons\cocbot.ico")
TraySetIcon(@ScriptDir & "\Icons\cocbot.ico")
$txtLog = _GUICtrlRichEdit_Create($frmBot, "", 16, 40, 385, 205, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL, 8912))
$tabMain = GUICtrlCreateTab(8, 8, 403, 395)
GUICtrlSetOnEvent(-1, "tabMain")

;Buttons at bottom of all tabs

$btnStart = GUICtrlCreateButton("Start Bot", 30, 365, 75, 25)
GUICtrlSetOnEvent(-1, "btnStart")
$btnStop = GUICtrlCreateButton("Stop Bot", 30, 365, 75, 25)
GUICtrlSetOnEvent(-1, "btnStop")
GUICtrlSetState(-1, $GUI_HIDE)
$btnHide = GUICtrlCreateButton("Hide BS", 110, 365, 75, 25)
GUICtrlSetOnEvent(-1, "btnHide")
GUICtrlSetState(-1, $GUI_DISABLE)
$chkBackground = GUICtrlCreateCheckbox("Background Mode", 195, 361, 105, 15)
GUICtrlSetBkColor($chkBackground, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkBackground")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Activate Background Mode")
$chkForceBS = GUICtrlCreateCheckbox("Force Active", 195, 380, 105, 15)
GUICtrlSetBkColor($chkForceBS, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkForceBS")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Force activate Bluestack if unable to locate")
$btnAtkNow = GUICtrlCreateButton("Attack Now", 310, 365, 75, 25) ;GB - Add Attack Now button
GUICtrlSetOnEvent(-1, "btnAtkNow")
GUICtrlSetState(-1, $GUI_DISABLE)

;General Tab
$pageGeneral = GUICtrlCreateTabItem("General")
$Controls = GUICtrlCreateGroup("Controls", 15, 245, 385, 66)
$chkNoAttack = GUICtrlCreateCheckbox("Donate/Train Only", 37, 264, 105, 15)
GUICtrlSetBkColor(-1, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkNoAttack")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Disable attacking, only do collections/training/donating")
$chkDonateOnly = GUICtrlCreateCheckbox("Donate Only", 198, 264, 80, 17)
GUICtrlSetBkColor(-1, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkDonateOnly")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Disable attacking & training, only do collections/donating")
$chkBotStop = GUICtrlCreateCheckbox("", 37, 289, 16, 16)
$cmbBotCommand = GUICtrlCreateCombo("", 60, 285, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Halt Attack Mode|Shutdown PC|Sleep PC", "Halt Attack Mode")
$lblPC = GUICtrlCreateLabel("IF :", 178, 289, 25, 17)
$cmbBotCond = GUICtrlCreateCombo("", 198, 285, 163, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "G and E Full and Max.Trophy|(G and E) Full or Max.Trophy|(G or E) Full and Max.Trophy|G or E Full or Max.Trophy|Gold and Elixir Full|Gold or Elixir Full|Gold Full and Max.Trophy|Elixir Full and Max.Trophy|Gold Full or Max.Trophy|Elixir Full or Max.Trophy|Gold Full|Elixir Full|Reach Max. Trophy", "Gold and Elixir Full")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$otherSettings = GUICtrlCreateGroup("Other Settings", 15, 315, 385, 41)
$lblBoostBarracks = GUICtrlCreateLabel("Barracks Boosts left :", 37, 332, 100, 17)
$cmbBoostBarracks = GUICtrlCreateCombo("", 150, 328, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5", "0")
$lblMaxTrophy = GUICtrlCreateLabel("Max Trophy :", 230, 332, 66, 17)
$txtMaxTrophy = GUICtrlCreateInput("3000", 298, 328, 71, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 4)
GUICtrlSetTip(-1, "Bot will lose trophies if your trophy is greater than this.")
GUICtrlCreateGroup("", -99, -99, 1, 1)


;Search Tab
$pageSearchSetting = GUICtrlCreateTabItem("Search")
$Searchonly = GUICtrlCreateGroup("Search Only", 15, 315, 385, 41)
$btnSearchMode = GUICtrlCreateButton("Search Mode", 24, 327, 368, 25)
GUICtrlSetOnEvent(-1, "btnSearchMode")
GUICtrlSetTip(-1, "Does not attack. Searches for base that meets conditions.")
;GB - Redo conditions for base search
$DeadConditions = GUICtrlCreateGroup("Dead Base Conditions", 15, 40, 390, 135)
$lblDeadConditions = GUICtrlCreateLabel("Select the conditions that must ALL be met to stop for a base with full collectors", 20, 60, 380, 20, $SS_CENTER)
$chkDeadGE = GUICtrlCreateCheckbox("Min Resources:", 30, 83, 100, 17)
$lblDeadMinGold = GUICtrlCreateLabel("Gold: ", 140, 85, 28, 17)
$txtDeadMinGold = GUICtrlCreateInput("50000", 170, 80, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$cmbDead = GUICtrlCreateCombo("", 240, 80, 45, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "And|Or", "And")
$lblDeadMinElixir = GUICtrlCreateLabel("Elixir: ", 300, 85, 28, 17)
$txtDeadMinElixir = GUICtrlCreateInput("50000", 330, 80, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$chkDeadMeetDE = GUICtrlCreateCheckbox("Min Dark Elixir:", 30, 113, 95, 17)
$txtDeadMinDarkElixir = GUICtrlCreateInput("0", 130, 110, 60, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$chkDeadMeetTrophy = GUICtrlCreateCheckbox("Min Trophies:", 225, 113, 95, 17)
$txtDeadMinTrophy = GUICtrlCreateInput("0", 325, 110, 60, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$chkDeadMeetTH = GUICtrlCreateCheckbox("Max TH Level:", 30, 143, 95, 17)
$cmbDeadTH = GUICtrlCreateCombo("", 130, 140, 60, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")
$chkDeadMeetTHO = GUICtrlCreateCheckbox("Townhall Outside", 225, 143, 100, 17)
$AnyConditions = GUICtrlCreateGroup("Any Base Conditions", 15, 180, 390, 130)
$lblAnyConditions = GUICtrlCreateLabel("Select the conditions that must ALL be met to stop for any base", 20, 200, 380, 20, $SS_CENTER)
$chkMeetGE = GUICtrlCreateCheckbox("Min Resources: ", 30, 223, 100, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$lblMinGold = GUICtrlCreateLabel("Gold:", 140, 225, 28, 17)
$txtMinGold = GUICtrlCreateInput("80000", 170, 220, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$cmbAny = GUICtrlCreateCombo("", 240, 220, 45, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "And|Or", "And")
$lblMinElixir = GUICtrlCreateLabel("Elixir:", 300, 225, 28, 17)
$txtMinElixir = GUICtrlCreateInput("80000", 330, 220, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$chkMeetDE = GUICtrlCreateCheckbox("Min Dark Elixir:", 30, 253, 95, 17)
$txtMinDarkElixir = GUICtrlCreateInput("0", 130, 250, 60, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$chkMeetTrophy = GUICtrlCreateCheckbox("Min Trophies:", 225, 253, 95, 17)
$txtMinTrophy = GUICtrlCreateInput("0", 325, 250, 60, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$chkMeetTH = GUICtrlCreateCheckbox("Max TH Level:", 30, 283, 95, 17)
$cmbTH = GUICtrlCreateCombo("", 130, 280, 60, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")
$chkMeetTHO = GUICtrlCreateCheckbox("Townhall Outside", 225, 283, 100, 17)
;GB - Move to misc tab
;$OtherSearchSettings = GUICtrlCreateGroup("Other Search Settings", 15, 262, 385, 55)
;$chkAlertSearch = GUICtrlCreateCheckbox("Alert when Base Found", 50, 287, 132, 17)
;GUICtrlSetState(-1, $GUI_CHECKED)
;$chkTakeTownSS = GUICtrlCreateCheckbox("Take All Towns Snapshot", 220, 275, 142, 17)
;$chkTakeLootSS = GUICtrlCreateCheckbox("Take All Loots Snapshot", 220, 295, 132, 17)
;GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)


;Attack Tab
$pageAttackSettings = GUICtrlCreateTabItem("Attack")
;GB - Create new attack settings
$DeadDeploySettings = GUICtrlCreateGroup("Dead Base Deploy Settings", 15, 40, 390, 135)
$cmbDeadDeploy = GUICtrlCreateCombo("", 30, 60, 360, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Attack on a single side, penetrates through base|Attack on two sides, penetrates through base|Attack on three sides, gets outer and some inside of base|Attack on all sides equally, gets most of outer base", "Attack on all sides equally, gets most of outer base")
$cmbDeadAlgorithm = GUICtrlCreateCombo("", 30, 90, 360, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks|Use All Troops", "Use All Troops") ;"Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks"
$chkDeadUseKing = GUICtrlCreateCheckbox("Attack with King", 30, 120, 150, 17)
$chkDeadUseQueen = GUICtrlCreateCheckbox("Attack with Queen", 200, 120, 150, 17)
$chkDeadUseClanCastle = GUICtrlCreateCheckbox("Attack with Clan Castle troops", 30, 140, 160, 17)
$chkDeadAttackTH = GUICtrlCreateCheckbox("Attack Townhall (Outside)", 200, 140, 160, 17)
GUICtrlSetTip(-1, "Troops target Townhall when on the outside of a dead base. Enforces a match during base search if Townhall on outside and base is dead")

$AnyDeploySettings = GUICtrlCreateGroup("Other Base Deploy Settings", 15, 180, 390, 130)
$cmbDeploy = GUICtrlCreateCombo("", 30, 200, 360, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Attack on a single side, penetrates through base|Attack on two sides, penetrates through base|Attack on three sides, gets outer and some inside of base|Attack on all sides equally, gets most of outer base", "Attack on all sides equally, gets most of outer base")
$cmbAlgorithm = GUICtrlCreateCombo("", 30, 230, 360, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks|Use All Troops", "Use All Troops") ;"Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks"
$chkUseKing = GUICtrlCreateCheckbox("Attack with King", 30, 260, 150, 17)
$chkUseQueen = GUICtrlCreateCheckbox("Attack with Queen", 200, 260, 150, 17)
$chkUseClanCastle = GUICtrlCreateCheckbox("Attack with Clan Castle troops", 30, 280, 160, 17)
$chkAttackTH = GUICtrlCreateCheckbox("Attack Townhall (Outside)", 200, 280, 160, 17)
GUICtrlSetTip(-1, "Troops target Townhall when on the outside of a base. Enforces a match during base search if Townhall on outside")

#cs ;GB - Redo all settings for attack page
$WeakBaseSettings = GUICtrlCreateGroup("Weak Base Settings", 15, 35, 130, 230)
$lblMortar = GUICtrlCreateLabel("Max Mortar Lvl:", 20, 58, 77, 17)
$cmbMortar = GUICtrlCreateCombo("", 100, 55, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8", "5")
GUICtrlSetState(-1, $GUI_DISABLE)
$lblWizardTower = GUICtrlCreateLabel("Wiz Tower Lvl:", 20, 83, 75, 17)
$cmbWizTower = GUICtrlCreateCombo("", 100, 80, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8", "4")
GUICtrlSetState(-1, $GUI_DISABLE)
$lblCannon = GUICtrlCreateLabel("Cannon Lvl:", 20, 108, 61, 17)
$lblArcher = GUICtrlCreateLabel("Archer Lvl:", 20, 133, 55, 17)
$chkWithKing = GUICtrlCreateCheckbox("Attack their King", 20, 180, 112, 17, BitOR($GUI_SS_DEFAULT_CHECKBOX, $BS_RIGHTBUTTON))
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetState(-1, $GUI_DISABLE)
$chkWithQueen = GUICtrlCreateCheckbox("Attack their Queen", 20, 200, 112, 17, BitOR($GUI_SS_DEFAULT_CHECKBOX, $BS_RIGHTBUTTON))
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbCannon = GUICtrlCreateCombo("", 100, 105, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8|9|10|11|12|13", "8")
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbArcher = GUICtrlCreateCombo("", 100, 130, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8|9|10|11|12|13", "8")
GUICtrlSetState(-1, $GUI_DISABLE)
$lblWeakDescription = GUICtrlCreateLabel("Bot will attack bases that meet requirement.", 17, 225, 125, 32, $SS_CENTER)
$lblxBow = GUICtrlCreateLabel("X-Bow Lvl:", 20, 158, 55, 17)
$cmbxBow = GUICtrlCreateCombo("", 100, 155, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8|9|10|11|12|13", "0")
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$AttackMode = GUICtrlCreateGroup("Attack Mode", 150, 35, 250, 93)
$radDeadBases = GUICtrlCreateRadio("Dead Bases - Meets condition, full collectors", 160, 55, 238, 17)
GUICtrlSetState(-1, $GUI_DISABLE) ;GB - Disable for now as no longer required
$radWeakBases = GUICtrlCreateRadio("Weak Bases - Meets condition and able 50%", 160, 75, 228, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$radAllBases = GUICtrlCreateRadio("All Bases - Attack all that meets search.", 160, 95, 228, 17)
GUICtrlSetState(-1, $GUI_DISABLE) ;GB - Disable for now as no longer required
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$HeroesSettings = GUICtrlCreateGroup("Royals and Clan Castle Settings", 150, 130, 250, 135)
$lblKingSettings = GUICtrlCreateLabel("King Settings:", 165, 150, 69, 17)
$chkKingAttackDeadBases = GUICtrlCreateCheckbox("Atk Dead Bases", 165, 170, 97, 17)
$chkKingAttackWeakBases = GUICtrlCreateCheckbox("Atk Weak Bases", 165, 190, 97, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$chkKingAttackAllBases = GUICtrlCreateCheckbox("Atk All Bases", 165, 210, 97, 17)
$lblQueenSettings = GUICtrlCreateLabel("Queen Settings:", 285, 150, 80, 17)
$chkQueenAttackDeadBases = GUICtrlCreateCheckbox("Atk Dead Bases", 285, 170, 97, 17)
$chkQueenAttackWeakBases = GUICtrlCreateCheckbox("Atk Weak Bases", 285, 190, 97, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$chkQueenAttackAllBases = GUICtrlCreateCheckbox("Atk All Bases", 285, 210, 97, 17)
$chkUseClanCastle = GUICtrlCreateCheckbox("Atk using Clan Castle troops if available", 165, 235, 210, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$deploySettings = GUICtrlCreateGroup("Deploy Settings", 15, 270, 385, 85)
$chkAttackTH = GUICtrlCreateCheckbox("Attack Townhall (Outside)", 250, 320, 142, 17)
$cmbDeploy = GUICtrlCreateCombo("", 30, 290, 360, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Attack on a single side, penetrates through base|Attack on two sides, penetrates through base|Attack on three sides, gets outer and some inside of base|Attack on all sides equally, gets most of outer base", "Attack on all sides equally, gets most of outer base")
$cmbAlgorithm = GUICtrlCreateCombo("", 30, 320, 215, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks|Use All Troops", "Use All Troops") ;"Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks"
#ce

GUICtrlCreateGroup("", -99, -99, 1, 1)


;Donate Tab
$pageDonateSettings = GUICtrlCreateTabItem("Donate")
$Donation = GUICtrlCreateGroup("", 15, 30, 385, 325)
$Barbarians = GUICtrlCreateGroup("Barbarians", 20, 70, 120, 235)
$chkDonateAllBarbarians = GUICtrlCreateCheckbox("Donate to All", 30, 95, 97, 17)
$txtDonateBarbarians = GUICtrlCreateEdit("", 25, 120, 110, 179, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL))
GUICtrlSetData(-1, StringFormat("barbarians\r\nbarb\r\nany\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Barbarians")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Archers = GUICtrlCreateGroup("Archers", 148, 70, 120, 235)
$chkDonateAllArchers = GUICtrlCreateCheckbox("Donate to All", 155, 95, 97, 17)
$txtDonateArchers = GUICtrlCreateEdit("", 153, 120, 110, 179, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL))
GUICtrlSetData(-1, StringFormat("archers\r\narch\r\nany\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Archers")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Giants = GUICtrlCreateGroup("Giants", 275, 70, 120, 235)
$chkDonateAllGiants = GUICtrlCreateCheckbox("Donate to All", 285, 95, 97, 17)
$txtDonateGiants = GUICtrlCreateEdit("", 280, 120, 110, 179, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL))
GUICtrlSetData(-1, StringFormat("giants\r\ngiant\r\nany\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Giants")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$chkDonateGiants = GUICtrlCreateCheckbox("Donate Giants", 275, 305, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkDonateArchers = GUICtrlCreateCheckbox("Donate Archers", 149, 305, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkDonateBarbarians = GUICtrlCreateCheckbox("Donate Barbarians", 20, 305, 112, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkRequest = GUICtrlCreateCheckbox("Request for :", 30, 45, 82, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUISetOnEvent(-1, "chkRequest")
$txtRequest = GUICtrlCreateInput("any", 115, 45, 276, 21)
GUICtrlSetTip(-1, "Request for input.")
$btnLocateClanCastle = GUICtrlCreateButton("Locate Clan Castle Manually", 25, 325, 365, 25)
GUICtrlSetOnEvent(-1, "btnLocateClanCastle")
GUICtrlCreateGroup("", -99, -99, 1, 1)


;Troops Tab
$pageTroopSettings = GUICtrlCreateTabItem("Troops")
$Barracks = GUICtrlCreateGroup("Troops", 20, 40, 185, 215)
$lblBarbarians = GUICtrlCreateLabel("Barbarians :", 30, 68, 60, 17)
$lblArchers = GUICtrlCreateLabel("Archers :", 30, 93, 46, 17)
$lblGoblins = GUICtrlCreateLabel("Goblins :", 30, 118, 45, 17)
$lblCapacity = GUICtrlCreateLabel("Camp Capacity :", 30, 143, 95, 17)
$lblRaidcap = GUICtrlCreateLabel("Raid Capacity :", 30, 168, 95, 17)
$cmbRaidcap = GUICtrlCreateCombo("", 120, 165, 56, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "70|80|90|100", "100")
$lblPercentCapacity = GUICtrlCreateLabel("%", 180, 168, 12, 17)
$txtBarbarians = GUICtrlCreateInput("30", 120, 65, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetState(-1, $GUI_DISABLE)
$txtArchers = GUICtrlCreateInput("60", 120, 90, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetState(-1, $GUI_DISABLE)
$txtGoblins = GUICtrlCreateInput("10", 120, 115, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetState(-1, $GUI_DISABLE)
$txtCapacity = GUICtrlCreateInput("0", 120, 140, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$lblPercentBarbarians = GUICtrlCreateLabel("%", 180, 68, 12, 17)
$lblPercentArchers = GUICtrlCreateLabel("%", 180, 93, 12, 17)
$lblPercentGoblins = GUICtrlCreateLabel("%", 180, 118, 12, 17)
$cmbTroopComp = GUICtrlCreateCombo("", 45, 200, 131, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUISetOnEvent(-1, "cmbTroopComp")
GUICtrlSetData(-1, "Archers|Barbarians|Goblins|B.Arch|B.A.G.G.|B.A.Giant|B.A.Goblin|B.A.G.G.Wall|Use Barracks|Custom Troops", "Use Barracks") ;"Archers|Barbarians|Goblins|B.Arch|B.A.G.G.|B.A.Giant|B.A.Goblin|B.A.G.G.Wall|Use Barracks|Custom Troops"
;$lblBarracks = GUICtrlCreateLabel("Must equal 100% to fully distribute the troops with maximum amount efficiency.", 40, 205, 140, 67, $SS_CENTER)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$OtherTroops = GUICtrlCreateGroup("Other Troops", 210, 40, 185, 85)
$lblGiants = GUICtrlCreateLabel("Number of Giants:", 215, 68, 89, 17)
$lblWallBreakers = GUICtrlCreateLabel("Number of Wall Breakers:", 215, 93, 125, 17)
$txtNumGiants = GUICtrlCreateInput("4", 340, 65, 46, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetState(-1, $GUI_DISABLE)
$txtNumWallbreakers = GUICtrlCreateInput("4", 340, 90, 46, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$BarrackGroup = GUICtrlCreateGroup("Barracks", 210, 130, 185, 125)
$lblBarrack1 = GUICtrlCreateLabel("Barrack 1:", 220, 153, 53, 17)
$lblBarrack2 = GUICtrlCreateLabel("Barrack 2:", 220, 178, 53, 17)
$lblBarrack3 = GUICtrlCreateLabel("Barrack 3:", 220, 203, 53, 17)
$lblBarrack4 = GUICtrlCreateLabel("Barrack 4:", 220, 228, 53, 17)
$cmbBarrack1 = GUICtrlCreateCombo("", 275, 150, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins", "Barbarians") ; "Barbarians|Archers|Giants|Goblins"
$cmbBarrack2 = GUICtrlCreateCombo("", 275, 175, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins", "Archers") ; "Barbarians|Archers|Giants|Goblins"
$cmbBarrack3 = GUICtrlCreateCombo("", 275, 200, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins", "Archers") ; "Barbarians|Archers|Giants|Goblins"
$cmbBarrack4 = GUICtrlCreateCombo("", 275, 225, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins", "Goblins") ; "Barbarians|Archers|Giants|Goblins"
GUICtrlCreateGroup("", -99, -99, 1, 1)
;GB - New locate buttons
$LocationSettings = GUICtrlCreateGroup("Locate Buildings", 20, 255, 375, 100)
;$btnLocateCollectors = GUICtrlCreateButton("Locate Collectors Manually", 32, 280, 351, 25)
;GUICtrlSetOnEvent(-1, "btnLocateCollectors")
$btnLocateXbow = GUICtrlCreateButton("Locate X-Bow Manually", 32, 297, 170, 25)
GUICtrlSetOnEvent(-1, "btnLocateXbow")
$btnLocateInferno = GUICtrlCreateButton("Locate Inferno Tower Manually", 32, 324, 170, 25)
GUICtrlSetOnEvent(-1, "btnLocateInferno")
$btnLocateClanCastle2 = GUICtrlCreateButton("Locate Clan Castle Manually", 213, 270, 170, 25)
GUICtrlSetOnEvent(-1, "btnLocateClanCastle")
$btnLocateCamp = GUICtrlCreateButton("Locate Camp Manually", 213, 297, 170, 25)
GUICtrlSetOnEvent(-1, "btnLocateCamp")
$btnLocateTrap = GUICtrlCreateButton("Locate Trap Manually", 32, 270, 170, 25)
GUICtrlSetOnEvent(-1, "btnLocateTrap")
$btnLocateBarracks = GUICtrlCreateButton("Locate Barracks Manually", 213, 324, 170, 25)
GUICtrlSetOnEvent(-1, "btnLocateBarracks")
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

;Misc Tab
$pageAttackSettings = GUICtrlCreateTabItem("Misc")
$Miscs = GUICtrlCreateGroup("Misc", 15, 35, 385, 180)
$lblReconnect = GUICtrlCreateLabel("Reconnect Interval:", 30, 55, 100, 17)
$txtReconnect = GUICtrlCreateInput("2", 130, 50, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$lblReconnectmin = GUICtrlCreateLabel("minutes", 165, 55, 100, 17)

$lblSearchsp = GUICtrlCreateLabel("Seach Base Speed:", 30, 85, 100, 17)
$cmbSearchsp = GUICtrlCreateCombo("", 130, 80, 50, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5", "1") ; Search Base Speed
$lblSearchspd = GUICtrlCreateLabel("Tips: 0 = Fast, 5 = Slow", 188, 85, 200, 17)

$lblReturnh = GUICtrlCreateLabel("Return Home Delay:", 30, 115, 100, 17)
$txtReturnh = GUICtrlCreateInput("10", 130, 110, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$lblReturndelay = GUICtrlCreateLabel("seconds after no income detected", 165, 115, 200, 17)

$lblAttackp = GUICtrlCreateLabel("Attack Style:", 30, 145, 100, 17)
$cmbAttackp = GUICtrlCreateCombo("", 130, 140, 50, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "v5.5|v5.6", "v5.6") ; attack pattern
$lblAttackpatt = GUICtrlCreateLabel("Tips: v5.6 with random deployment speed", 188, 145, 200, 17)

;GB - moved settings
$chkTakeTownSS = GUICtrlCreateCheckbox("Take All Towns Snapshot", 30, 170, 142, 17)
$chkTakeLootSS = GUICtrlCreateCheckbox("Take All Loots Snapshot", 220, 170, 132, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkAlertSearch = GUICtrlCreateCheckbox("Alert when Base Found", 30, 190, 132, 17)


$Walls = GUICtrlCreateGroup("Walls ", 15, 220, 385, 135)
$chkWalls = GUICtrlCreateCheckbox("Auto Wall Upgrade", 30, 250, 110, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$UseGold = GUICtrlCreateRadio("Use Only Gold", 40, 275, 115, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$WallMinGold = GUICtrlCreateLabel("Minimum Gold: ", 220, 280, 76, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$txtWallMinGold = GUICtrlCreateInput("1300000", 330, 275, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 7)
GUICtrlSetState(-1, $GUI_DISABLE)
$UseElixir = GUICtrlCreateRadio("Use Only Elixir", 40, 300, 115, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$WallMinElixir = GUICtrlCreateLabel("Minimum Elixir:", 220, 305, 72, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$txtWallMinElixir = GUICtrlCreateInput("1300000", 330, 300, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 7)
GUICtrlSetState(-1, $GUI_DISABLE)
$UseGoldElix = GUICtrlCreateRadio("Use Elixir. If not enough, Gold", 40, 325, 160, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$lblWalls = GUICtrlCreateLabel("Current Wall Level:", 220, 252, 100, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbWalls = GUICtrlCreateCombo("", 330, 248, 40, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "4|5|6|7|8|9|10", "4")
GUICtrlSetState(-1, $GUI_DISABLE)

GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

;Bottom status bar
$statLog = _GUICtrlStatusBar_Create($frmBot)
_GUICtrlStatusBar_SetSimple($statLog)
_GUICtrlStatusBar_SetText($statLog, "Status : Idle")
$tiAbout = TrayCreateItem("About")
TrayCreateItem("")
$tiExit = TrayCreateItem("Exit")
GUISetState(@SW_SHOW)