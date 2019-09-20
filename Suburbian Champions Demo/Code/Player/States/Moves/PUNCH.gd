extends Node2D

onready var Ani = $"../../Sprites/AnimationPlayer"
onready var Root = $"../.."
onready var States = $"../../Basic_States"
onready var input = $"../../InputManager/InputReceiver"

func Update(delta):
	Root.idle = false
	if Root.command != 3:
		States.ChangeStateInt(Root.command)

	if Root.P1:
		Root.Velocity = Vector2.ZERO
	if Ani.current_animation != "Punch":
		Ani.play("Punch")
		
func End():
	input.AddEmptyCommand()
	Root.idle = true
	Root.command = 0
	States.ChangeStateInt(Root.command)