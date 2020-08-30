extends Node2D

onready var key = $"../".Key.none

onready var debugP1 = $"../../../LevelManager/Camera2D/P1"
onready var debugP2 = $"../../../LevelManager/Camera2D/P2"


var Debug = false

func _process(delta):
	if $"../".P1:
		key = KeyInputP1()
	
	if Input.is_action_just_released("Debug"):
		Debug = !Debug
		ShowDebug()


func ShowDebug():
	if Debug:
		debugP1.show()
		debugP2.show()
	else:
		debugP1.hide()
		debugP2.hide()


func KeyInputP1():
	var k = $"../".Key.none
	
	if Input.is_action_pressed("P1Left"):
		k = $"../".Key.left
	if Input.is_action_pressed("P1Right"):
		k = $"../".Key.right
	if Input.is_action_pressed("P1Up"):
		k = $"../".Key.up
	if Input.is_action_pressed("P1Down"):
		k = $"../".Key.down
	
	return k
