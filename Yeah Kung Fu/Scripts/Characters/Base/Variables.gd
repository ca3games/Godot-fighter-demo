extends Node

export (float) var SideAngle
export (NodePath) var FSMPath
onready var FSM = get_node(FSMPath)

func SetSideRight(side):
	if FSM.sideright != side:
		FSM.sideright = side
		if side:
			FSM.Root.rotation_degrees.y = SideAngle
		else:
			FSM.Root.rotation_degrees.y = -SideAngle

func SetRightStart(side):
	FSM.sideright = side
	if side:
		FSM.Root.rotation_degrees.y = SideAngle
	else:
		FSM.Root.rotation_degrees.y = -SideAngle

func WeakHurt():
	FSM.current = $"../HURT"
	FSM.current.start = false
