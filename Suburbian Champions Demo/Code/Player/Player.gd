extends KinematicBody2D

onready var onground = false
export(bool) var P1
export(int) var HP
export(bool) var AI
onready var Velocity = Vector2(0,0)
onready var speed = 100
onready var idle = true
var command = 0

func _ready():
	if not P1:
		$Sprites.scale.x = -1
	

func HIT():
	command = 5
	$Basic_States.ChangeState("HURT")

func _on_Melee_body_entered(body):
	if body.is_in_group("Player"):
		if body.P1 != P1:
			body.HIT()
