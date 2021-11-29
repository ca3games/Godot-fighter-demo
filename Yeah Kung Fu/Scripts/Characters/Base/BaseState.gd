extends Node

export(NodePath) var FSMPath
onready var FSM = get_node(FSMPath)

func Update(delta):
	pass

func Physics(delta):
	pass

func WalkInput():
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
		
func Normals():
	if Input.is_action_just_released("P1PUNCH"):
		if FSM.Root.P1:
			FSM.current = $"../PUNCH"
