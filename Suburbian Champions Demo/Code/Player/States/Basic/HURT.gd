extends Node2D

# HURT STATE

onready var Ani = $"../../Sprites/AnimationPlayer"
onready var Root = $"../.."
onready var States = get_parent()
onready var input = $"../../InputManager/InputReceiver"

func Update(delta):
	
	Root.idle = false
	
	if Root.command != 5:
		States.ChangeStateInt(Root.command)

	if Root.P1:
		Root.Velocity = Vector2.LEFT * (Root.speed / 2)* delta
	else:
		Root.Velocity = Vector2.RIGHT * (Root.speed / 2) * delta
	if Ani.current_animation != "HURT":
		Ani.play("HURT")

#This function plays at the end of the hurt animation
func End():
	input.AddEmptyCommand()
	Root.idle = true
	Root.command = 0
	States.ChangeStateInt(Root.command)