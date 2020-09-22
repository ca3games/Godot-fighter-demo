extends Node2D

export (bool) var P1
var Right = false

var id = 0
var Characters = []

func _ready():
	Right = P1

func GetPos():
	return Characters[id].position

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
