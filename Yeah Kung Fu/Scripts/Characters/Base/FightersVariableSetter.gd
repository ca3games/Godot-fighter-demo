extends Node

export (NodePath) var P1Path
export (NodePath) var P2Path
onready var P1 = get_node(P1Path)
onready var P2 = get_node(P2Path)


func _ready():
	yield(get_tree(), "idle_frame")
	setSide(true)

func _process(delta):
	setSide(false)
	

func setSide(start):
	if P1.global_transform.origin.x < P2.global_transform.origin.x:
		P1.SetSide(true, start)
		P2.SetSide(false, start)
	else:
		P1.SetSide(false, start)
		P2.SetSide(true, start)
