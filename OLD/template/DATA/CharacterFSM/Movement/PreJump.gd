extends Node2D

export (String) var Anim

onready var Root = $"../../../"
onready var FSM = $"../../"
onready var Ani = Root.get_node("AnimationPlayer")
onready var Movements = $"../"

func Inputs(delta):
	pass
	
func Physics(delta):
	if Ani.current_animation != "Anim":
		Ani.current_animation = Anim

func Jump():
	FSM.IsJump = true
	match(FSM.Commands.non_idle_command):
		6:
			match (FSM.Direction):
				0: FSM.ChangeState(Movements.Hop, "Movements")
				1: FSM.ChangeState(Movements.Hop_F, "Movements")
				2: FSM.ChangeState(Movements.Hop_B, "Movements")
		7:
			match (FSM.Direction):
				0: FSM.ChangeState(Movements.Jump, "Movements")
				1: FSM.ChangeState(Movements.Jump_F, "Movements")
				2: FSM.ChangeState(Movements.Jump_B, "Movements")
		_:
			match (FSM.Direction):
				0: FSM.ChangeState(Movements.Jump, "Movements")
				1: FSM.ChangeState(Movements.Jump_F, "Movements")
				2: FSM.ChangeState(Movements.Jump_B, "Movements") 
