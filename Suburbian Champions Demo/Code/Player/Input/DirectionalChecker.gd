extends Node2D

onready var Root = $"../../"
onready var checker = $"../MoveChecker"
onready var P1GUI = $"../../../GUI/P1inputs"

enum command {
	idle, walk, walk_back, punch, spunch
	}
var current

func _process(delta):
	if Root.P1:
		match(checker.current):
			0 : 
				current = command.walk_back
				P1GUI.UpdateCommand("WALK BACK")
			1 : 
				current = command.walk
				P1GUI.UpdateCommand("WALK")
			2 : 
				current = command.punch
				P1GUI.UpdateCommand("PUNCH")
			3 : 
				current = command.spunch
				P1GUI.UpdateCommand("S PUNCH")
			4 :
				current = command.idle
				P1GUI.UpdateCommand("IDLE")
	else:
		match(checker.current):
			0 : 
				current = command.walk
			1 : 
				current = command.walk_back
			2 : 
				current = command.punch
			3 : 
				current = command.spunch
			4 :
				current = command.idle