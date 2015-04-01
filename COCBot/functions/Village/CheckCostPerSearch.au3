;Will detect how much gold per search

Func CheckCostPerSearch()
    If $SearchCost = 0 Then
		Click($TownHallPos[0], $TownHallPos[1]) ; Click Townhall
		If _Sleep(1000) Then Return
		Click(384, 592); Click Info
		Local $THLevel = getOther(495, 136, "Townhall")

		If $THLevel = "1" Then
			$SearchCost = 10
		If $THLevel = "2" Then
			$SearchCost = 50
		If $THLevel = "3" Then
			$SearchCost = 75
		If $THLevel = "4" Then
			$SearchCost = 110
		If $THLevel = "5" Then
			$SearchCost = 170
		If $THLevel = "6" Then
			$SearchCost = 250
		If $THLevel = "7" Then
			$SearchCost = 380
		If $THLevel = "8" Then
			$SearchCost = 580
		If $THLevel = "9" Then
			$SearchCost = 750
		If $THLevel = "10" Then
			$SearchCost = 1000
		EndIf
	EndIf
EndFunc   ;==>CheckGoldCostPerSearch