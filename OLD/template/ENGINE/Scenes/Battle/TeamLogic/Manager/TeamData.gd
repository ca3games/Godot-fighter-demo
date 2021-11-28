extends Node2D

export (bool) var P1
var Right = false

var id = 0
var Characters = []
var Combo = 0

func _ready():
	Right = P1

func GetPos():
	return Characters[id].position

func ResetCombo():
	if P1:
		$"../".ResetP2Combos()
	else:
		$"../".ResetP1Combos()

func AddHit():
	if P1:
		$"../".AddHitP1()
	else:
		$"../".AddHitP2()

func _process(delta):
	
	if P1:
		if GetPos().x < $"../Team2".GetPos().x:
			Right = false
		else:
			Right = true
	else:
		if GetPos().x < $"../Team".GetPos().x:
			Right = false
		else:
			Right = true
