extends Node2D

export (String) var Anim
export (Vector2) var speed

onready var Root = $"../../../"
onready var FSM = $"../../"
onready var Ani = Root.get_node("AnimationPlayer")
onready var Movements = $"../../Movements"
onready var force = Vector2.ZERO

func Inputs(delta):
	pass
	
func Physics(delta):
	if Ani.current_animation != "Anim":
		Ani.current_animation = Anim
	
	if FSM.IsJump:
		force = speed
		FSM.IsJump = false
		
	force.y += Variables.get_node("EngineData").Gravity
	if force.y > Variables.get_node("EngineData").MaxGravityAirHit:
		force.y = Variables.get_node("EngineData").MaxGravityAirHit
	
	Root.move_and_slide(force)
	for i in Root.get_slide_count():
		var collision = Root.get_slide_collision(i)
		if collision.collider.is_in_group("Ground"):
			if Movements.Idle != null:
				FSM.ChangeState(Movements.Idle, "Movements", 0)
				FSM.OnAir = false
			if collision.collider.is_in_group("Character"):
				collision.collider.move_and_slide(Vector2(-force.x*100, 0))
	
	if FSM.old_direction:
		Root.move_and_slide(force)
	else:
		Root.move_and_slide(Vector2(-force.x, 0))


func EndJump():
	FSM.get_node("Movements/Fall").force = force
	FSM.ChangeState(Movements.Fall, "Movements")
