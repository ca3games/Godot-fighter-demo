extends Node2D

#THIS SCRIPT TAKES DIRECTIONAL CHECKER COMMAND AND SEND IT
#TO THE ROOT COMMAND, WHICH WILL CHANGE THE STATE

onready var Directional = $"../DirectionalChecker"
onready var Root = $"../../"
onready var list = $"../ListAdd"

func _process(delta):
	if Root.idle:
		Root.command = Directional.current