extends Node2D

onready var Moves = "../Moves"

var current

func _ready():
	ChangeState("IDLE")

func _process(delta):
	if current != null:
		current.Update(delta)

func ChangeStateInt(number):
	match(number):
		0 : ChangeState("IDLE")
		1 : ChangeState("WALK")
		2 : ChangeState("WALK_BACK")
		3 : ChangeState("PUNCH")
		4 : ChangeState("SPUNCH")

func ChangeState(state):
	match(state):
		"IDLE" : current = get_node("IDLE")
		"WALK" : current = get_node("WALK")
		"WALK_BACK" : current = get_node("WALK_BACK")
		"HURT" : current = get_node("HURT")
		"PUNCH" : current = $"../Moves/PUNCH"
		"SPUNCH" : current = $"../Moves/SPUNCH"
		"HURT" : current = $HURT