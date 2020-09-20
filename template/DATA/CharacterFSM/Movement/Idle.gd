extends Node2D

export (String) var Anim

onready var Root = $"../../../"
onready var FSM = $"../../"
onready var Ani = Root.get_node("AnimationPlayer")
onready var Movements = $"../"

func Inputs(delta):
	if FSM.Commands == null:
		return
	
	match(FSM.Commands.last_command):
		1: FSM.ChangeState(Movements.Walk, "Movements", 1)
		2: FSM.ChangeState(Movements.Walk_B, "Movements", 2)
		5: FSM.ChangeState(Movements.Crouch, "Movements")
		0: FSM.ChangeState(Movements.Idle, "Movements")
	
	if FSM.Commands.last_command >= 6 and FSM.Commands.last_command <= 9:
			FSM.ChangeState(Movements.PreJump, "Movements")
	
func Physics(delta):
	if Ani.current_animation != "Anim":
		Ani.current_animation = Anim
