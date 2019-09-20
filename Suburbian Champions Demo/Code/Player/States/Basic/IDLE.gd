extends Node2D

#IDLE STATE

onready var Ani = $"../../Sprites/AnimationPlayer"
onready var Root = $"../.."
onready var States = get_parent()

func Update(delta):	
	Root.idle = true
	Root.Velocity = Vector2.ZERO
	if Ani.current_animation != "IDLE":
		Ani.play("IDLE")
		
	if Root.command != 0:
		States.ChangeStateInt(Root.command)