extends Node2D

export (String) var Anim
export (int) var Attack_id

onready var Root = $"../../../"
onready var FSM = $"../../"
onready var Ani = Root.get_node("AnimationPlayer")
onready var Movements = $"../../Movements"

func Inputs(delta):
	pass
	
func Physics(delta):
	if Ani.current_animation != "Anim":
		Ani.current_animation = Anim
		
func EndAnim():
	FSM.ChangeState(Movements.Idle, "Movements")

