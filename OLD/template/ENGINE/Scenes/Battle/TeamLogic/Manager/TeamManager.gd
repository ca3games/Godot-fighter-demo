extends Node2D

func ResetP1Combos():
	$Team.Combo = 0
	
func ResetP2Combos():
	$Team2.Combo = 0

func AddHitP1():
	$Team.Combo += 1

func AddHitP2():
	$Team2.Combo += 1
