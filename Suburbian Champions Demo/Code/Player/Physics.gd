extends Node2D

var gravity = 500
onready var R = get_parent()

func _physics_process(delta):
	
	#GRAVITY
	var collision = R.move_and_collide(Vector2(0, gravity) * delta)
	if collision:
		R.onground = true
	else:
		R.onground = false

	#WALK SPEED
	R.move_and_collide(R.Velocity * R.speed * delta)