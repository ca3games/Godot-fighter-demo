extends Node2D


func _ready():
	var tmp = load(Variables.get_node("LevelsData").Levels[Variables.get_node("LevelsData").id])
	var level = tmp.instance()
	$ViewportContainer/Viewport.add_child(level)
