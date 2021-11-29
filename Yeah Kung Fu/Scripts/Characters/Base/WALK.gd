extends "res://Scripts/Characters/Base/BaseState.gd"

export(float) var Speed
export(bool) var backwalk

func Update(delta):
	WalkInput()
	Normals()

func Physics(delta):
	var s = 0
	if FSM.sideright:
		s = 1
	else:
		s = -1
	var dir = Vector3(s * delta * Speed, 0, 0)
	FSM.Root.move_and_collide(dir, false)
	
	var i = FSM.AnimTree.get("parameters/Walk/blend_position")
	if backwalk and i > -0.9:
		FSM.AnimTree.set("parameters/Walk/blend_position", i - 0.3)
	elif !backwalk and i < 0.9:
		FSM.AnimTree.set("parameters/Walk/blend_position", i + 0.3)
