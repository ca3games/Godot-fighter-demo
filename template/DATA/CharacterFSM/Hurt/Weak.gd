extends Node2D

export (String) var Anim
export (Vector2) var speed

onready var Root = $"../../../"
onready var FSM = $"../../"
onready var Ani = Root.get_node("AnimationPlayer")
onready var Movements = $"../../Movements"


func Inputs(delta):
	pass
	
func Physics(delta):
	if Ani.current_animation != "Anim":
		Ani.current_animation = Anim
	
	if FSM.old_direction:
		Root.move_and_slide(speed)
	else:
		Root.move_and_slide(Vector2(-speed.x, 0))

func EndAnim():
	FSM.ChangeState(Movements.Idle, "Movements")
