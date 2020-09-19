extends Node2D

export (Vector2) var Speed

func _process(delta):
	$"../../PhysicsManager".speed = Speed
