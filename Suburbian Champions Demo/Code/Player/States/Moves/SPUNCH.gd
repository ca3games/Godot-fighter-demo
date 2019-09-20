extends Node2D

#STRONG PUNCH SCRIPT

onready var Ani = $"../../Sprites/AnimationPlayer"
onready var Root = $"../.."
onready var States = $"../../Basic_States"
onready var input = $"../../InputManager/InputReceiver"

func Update(delta):
	Root.idle = false
	if Root.command != 4:
		States.ChangeStateInt(Root.command)

	if Root.P1:
		Root.Velocity = Vector2.ZERO
	if Ani.current_animation != "SPunch":
		Ani.play("SPunch")
		
func End():
	input.AddEmptyCommand()
	Root.idle = true
	Root.command = 0
	States.ChangeState("IDLE")