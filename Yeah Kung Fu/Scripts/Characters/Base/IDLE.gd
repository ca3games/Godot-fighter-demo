extends "res://Scripts/Characters/Base/BaseState.gd"

func Update(delta):
	WalkInput()
	Normals()

func Physics(delta):
	var i = FSM.AnimTree.get("parameters/Walk/blend_position")
	if i < -0.4:
		FSM.AnimTree.set("parameters/Walk/blend_position", i + 0.4)
	elif i > 0.4:
		FSM.AnimTree.set("parameters/Walk/blend_position", i - 0.4)
	else:
		FSM.AnimTree.set("parameters/Walk/blend_position", 0)
	
	FSM.Root.move_and_collide(Vector3.ZERO, false)
