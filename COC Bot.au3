#RequireAdmin
#AutoIt3Wrapper_UseX64=n
#pragma compile(Icon, "Icons\cocbot.ico")
#pragma compile(FileDescription, Clash of Clans Bot - A Free/Open Sourced Clash of Clans bot - https://clashbot.org)
#pragma compile(ProductName, Clash of Clans Bot)
#pragma compile(ProductVersion, 5.7)
#pragma compile(FileVersion, 5.7)
#pragma compile(LegalCopyright, � The Bytecode Club)

$sBotVersion = "5.7.3.2"
$sBotTitle = "AutoIt ClashBot v" & $sBotVersion

If _Singleton($sBotTitle, 1) = 0 Then
	MsgBox(0, "", "Bot is already running.")
	Exit
 EndIf

If @AutoItX64 = 1 Then
	MsgBox(0, "", "Don't Run/Compile Script (x64)! try to Run/Compile Script (x86) to getting this bot work." & @CRLF & _
				  "If this message still appear, try to re-install your AutoIt with newer version.")
	Exit
EndIf

If Not FileExists(@ScriptDir & "\License.txt") Then
	$license = InetGet("http://www.gnu.org/licenses/gpl-3.0.txt", @ScriptDir & "\License.txt")
	InetClose($license)
EndIf

#include "COCBot\Global Variables.au3"
#include "COCBot\GUI Design.au3"
#include "COCBot\GUI Control.au3"
#include "COCBot\Functions.au3"
#include-once

DirCreate($dirLogs)
DirCreate($dirLoots)
DirCreate($dirAllTowns)

While 1
	Switch TrayGetMsg()
        Case $tiAbout
			MsgBox(64 + $MB_APPLMODAL + $MB_TOPMOST, $sBotTitle, "Clash of Clans Bot" & @CRLF & @CRLF & _
					"Version: " & $sBotVersion & @CRLF & _
					"Released under the GNU GPLv3 license.", 0, $frmBot)
		Case $tiExit
			ExitLoop
	EndSwitch
WEnd

Func runBot() ;Bot that runs everything in order
	While 1
		SaveConfig()
		readConfig()
		applyConfig()
		chkNoAttack() ;GB - check current state of config on startup
		$Restart = False
		$fullArmy = False
			If (GUICtrlRead($chkNoAttack) + GUICtrlRead($chkDonateOnly)) = 0 Then
			$CommandStop = -1
		EndIf
		If _Sleep(1000) Then Return
		checkMainScreen()
		If _Sleep(1000) Then Return
		ZoomOut()
		If _Sleep(1000) Then Return
		checkMainScreen(False)
		If $Restart = True Then ContinueLoop
		If BotCommand() Then btnStop()
		If _Sleep(1000) Then Return
		checkMainScreen(False)
	    If $Restart = True Then ContinueLoop
		ReArm()
		If _Sleep(1000) Then Return
		checkMainScreen(False)
		If $Restart = True Then ContinueLoop
		DonateCC()
		If _Sleep(1000) Then Return
		If $CommandStop <> 0 And $CommandStop <> 3 Then
			CheckArmyCamp()
			If _Sleep(1000) Then Return
		EndIf
		If $DCattack = 1 And $CommandStop <> 0 And $CommandStop <> 3 And $fullArmy Then
			checkMainScreen()
			If _Sleep(1000) Then Return
			ZoomOut()
			If _Sleep(1000) Then Return
			AttackMain()
			If _Sleep(1000) Then Return
			$fullArmy = False
		EndIf
		If $CommandStop <> 0 And $CommandStop <> 3 Then
			Train()
			If _Sleep(1000) Then Return
		EndIf
		checkMainScreen(False)
		If $Restart = True Then ContinueLoop
		BoostBarracks()
		If _Sleep(1000) Then Return
		RequestCC()
		If _Sleep(1000) Then Return
		checkMainScreen(False)
	    If $Restart = True Then ContinueLoop
		Collect()
		If _Sleep(1000) Then Return
		checkMainScreen(False)
		If $Restart = True Then ContinueLoop
		;UpgradeWall()
		;If _Sleep(1000) Then Return
		Idle()
		If _Sleep(1000) Then Return
	    If $Restart = True Then ContinueLoop
		If $CommandStop <> 0 And $CommandStop <> 3 Then
			checkMainScreen()
			If _Sleep(1000) Then Return
			ZoomOut()
			If _Sleep(1000) Then Return
			AttackMain()
			If _Sleep(1000) Then Return
		EndIf
	WEnd
EndFunc   ;==>runBot

Func Idle() ;Sequence that runs until Full Army
	Local $TimeIdle = 0 ;In Seconds
		While $fullArmy = False
			If $CommandStop = -1 Then SetLog("Waiting for troops to train...", $COLOR_PURPLE)
			Local $hTimer = TimerInit(), $x = 30000
			If $CommandStop = 3 Then $x = 15000
			If _Sleep($x) Then ExitLoop
			checkMainScreen()
			If _Sleep(1000) Then ExitLoop
			ZoomOut()
			If _Sleep(1000) Then ExitLoop
			If $iCollectCounter > $COLLECTATCOUNT Then ; This is prevent from collecting all the time which isn't needed anyway
				Collect()
				If _Sleep(1000) Or $RunState = False Then ExitLoop
				$iCollectCounter = 0
			EndIf
			$iCollectCounter = $iCollectCounter + 1
			If $CommandStop <> 3 Then
			    CheckArmyCamp()
			    If _Sleep(1000) Then Return
				Train()
				If _Sleep(1000) Then ExitLoop
			EndIf
			If $CommandStop = 0 And $fullArmy Then
				SetLog("Stopping Training, Army Camp Full", $COLOR_ORANGE)
				$CommandStop = 3
				$fullArmy = False
			EndIf
			If $CommandStop = -1 Then
				If $fullArmy Then ExitLoop
				DropTrophy()
				If _Sleep(1000) Then ExitLoop
			EndIf
			DonateCC()
			$TimeIdle += Round(TimerDiff($hTimer) / 1000, 2) ;In Seconds
			SetLog("Time Idle: " & Floor(Floor($TimeIdle / 60) / 60) & " hours " & Floor(Mod(Floor($TimeIdle / 60), 60)) & " minutes " & Floor(Mod($TimeIdle, 60)) & " seconds", $COLOR_ORANGE)
		WEnd
EndFunc   ;==>Idle

Func AttackMain() ;Main control for attack functions
		PrepareSearch()
	 If _Sleep(1000) Then Return
		$DCattack = 1
		VillageSearch($TakeAllTownSnapShot)
		If $CommandStop = 0 Then Return
	 If _Sleep(1000) Or $Restart = True Then Return
		PrepareAttack()
	 If _Sleep(1000) Then Return
		Attack()
		$DCattack = 0
	 If _Sleep(1000) Then Return
		ReturnHome($TakeLootSnapShot)
	 If _Sleep(1000) Then Return
EndFunc   ;==>AttackMain

Func Attack() ;Selects which algorithm
	SetLog("-----Starting Attack-----")
	Switch $attackpattern
		Case 0 ; v5.5
			SetLog("Attacking with v5.5 attacking Algorithm")
			algorithm_Troops()
		Case 1 ; v5.6
			SetLog("Attacking with v5.6 attacking Algorithm")
			algorithm_AllTroops()
	EndSwitch
EndFunc   ;==>Attack
