extends Node2D

export (Vector2) var Speed
export (float) var Gravity


func _process(delta):
	$"../../PhysicsManager".speed = Speed
	$"../../PhysicsManager".gravity = Gravity
