extends "res://Scripts/Characters/Base/BaseState.gd"

export(float) var Speed
export(bool) var backwalk

func Update(delta):
	var left = false
	var right = false
	if Input.is_action_pressed("P1Left"):
		if FSM.Root.P1:
			left = true
	if Input.is_action_pressed("P1Right"):
		if FSM.Root.P1:
			right = true
	
	if Input.is_action_pressed("P2LEFT"):
		if !FSM.Root.P1:
			left = true
	if Input.is_action_pressed("P2RIGHT"):
		if !FSM.Root.P1:
			right = true
	
	
	if right and not left:
		if not FSM.sideright:
			FSM.current = $"../WALKBACK"
		else:
			FSM.current = $"../WALK"

	if left and not right:
		if not FSM.sideright:
			FSM.current = $"../WALK"
		else:
			FSM.current = $"../WALKBACK"
	
	if not right and not left:
		FSM.current = $"../IDLE"

func Physics(delta):
	var s = 0
	if FSM.sideright:
		s = 1
	else:
		s = -1
	var dir = Vector3(s * delta * Speed, 0, 0)
	FSM.Root.move_and_collide(dir, false)
	
	var i = FSM.AnimTree.get("parameters/Walk/blend_position")
	if backwalk:
		FSM.AnimTree.set("parameters/Walk/blend_position", i - 0.1)
	else:
		FSM.AnimTree.set("parameters/Walk/blend_position", i + 0.1)
