extends ViewportContainer

onready var camera = $"../Camera2D"

func _process(delta):
	rect_position = camera.position - (rect_size / 2)
