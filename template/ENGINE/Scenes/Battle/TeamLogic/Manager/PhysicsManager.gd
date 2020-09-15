extends Node2D

var current
var speed = Vector2.ZERO
var gravity = 0

func _ready():
	yield(get_tree(), "idle_frame")
	current = $"../".Characters[0]


func _physics_process(delta):
	if current != null:
		var vector = speed
		vector.y += gravity
		current.move_and_slide(vector)
