extends Node2D

onready var Ani = $"../../Sprites/AnimationPlayer"
onready var Root = $"../.."
onready var States = get_parent()

func Update(delta):
		
	if Root.command != 2:
		States.ChangeStateInt(Root.command)

	if Root.P1:
		Root.Velocity = Vector2.LEFT * Root.speed * delta
	else:
		Root.Velocity = Vector2.RIGHT * Root.speed * delta
	if Ani.current_animation != "Walk Back":
		Ani.play("Walk Back")