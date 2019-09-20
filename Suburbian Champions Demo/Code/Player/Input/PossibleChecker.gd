extends Node2D

onready var Directional = $"../DirectionalChecker"
onready var Root = $"../../"
onready var list = $"../ListAdd"

func _process(delta):
	if Root.idle:
		Root.command = Directional.current