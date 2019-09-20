extends KinematicBody2D

# SCRIPT THAT TAKES INTO ACCOUNT VARIABLES OF THE CHAR

#check if player is touching the ground
onready var onground = false
#check if the character is Player 1
export(bool) var P1
#HP
export(int) var HP
#check if the character is controlled by AI
export(bool) var AI
#velocity of movement
onready var Velocity = Vector2(0,0)
#walking speed
onready var speed = 100
#variable that checks if the character is idle
onready var idle = true
#current command ID
var command = 0

func _ready():
	if not P1:
		#if not P1 then mirror the character
		$Sprites.scale.x = -1
	

func HIT():
	#ID of command that is hurt
	command = 5
	#Change state to "HURT" state
	$Basic_States.ChangeState("HURT")

#On enemy area of attack hitbox entered
func _on_Melee_body_entered(body):
	if body.is_in_group("Player"):
		if body.P1 != P1:
			body.HIT()
