extends Node2D

export (String) var Anim
var speed
var force = Vector2.ZERO

onready var Root = $"../../../"
onready var FSM = $"../../"
onready var Ani = Root.get_node("AnimationPlayer")
onready var Movements = $"../"


func Inputs(delta):
	pass

func Physics(delta):
	
	FSM.OnAir = true
	
	if Ani.current_animation != "Anim":
		Ani.current_animation = Anim
		
	force.y += Variables.get_node("EngineData").Gravity
	if force.y > Variables.get_node("EngineData").MaxGravity:
		force.y = Variables.get_node("EngineData").MaxGravity
	
	Root.move_and_slide(force)
	for i in Root.get_slide_count():
		var collision = Root.get_slide_collision(i)
		if collision.collider.is_in_group("Ground"):
			if Movements.Idle != null:
				FSM.OnAir = false
				FSM.ChangeState(Movements.Idle, "Movements", 0)
		if collision.collider.is_in_group("Character"):
			collision.collider.move_and_slide(Vector2(-force.x, 0))

