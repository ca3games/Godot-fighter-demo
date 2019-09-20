extends Node2D

onready var Root = $"../../"
onready var list = $"../ListAdd"
onready var P1GUI = $"../../../GUI/P1inputs"

#THIS NODE INTERPRETS THE LIST AND CHECK FOR COMMANDS
#DIRECTIONAL CHECKER TAKES THIS COMMAND AND CHECK FOR X POSITION MIRROR

enum move {
	walk_left, walk_right, punch, spunch, idle
	}
var current

func _process(delta):
		
	if list.keys[0].key == 0:
		current = move.idle
	if list.keys[0].key == 1 and list.keys[0].pressed_time > 3:
		current = move.walk_left
		P1GUI.UpdateMove("walk left")
	if list.keys[0].key == 2 and list.keys[0].pressed_time > 3:
		current = move.walk_right
		P1GUI.UpdateMove("walk right")
	if list.keys[0].key == 3:
		current = move.punch
		P1GUI.UpdateMove("punch")
	if list.keys[0].key == 4:
		current = move.spunch
		P1GUI.UpdateMove("Strong punch")
