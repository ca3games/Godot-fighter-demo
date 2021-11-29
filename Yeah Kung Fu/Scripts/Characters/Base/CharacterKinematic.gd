extends KinematicBody

export (bool) var P1
export(NodePath) var GUIPath
onready var GUI = get_node(GUIPath)

func SetSide(side, start):
	if start:
		$FSM/Variables.SetRightStart(side)
	else:
		$FSM/Variables.SetSideRight(side)

func Hurt(damage, type):
	GUI.Hit(damage, P1)
	match(type):
		"WEAK": $FSM/Variables.WeakHurt()
