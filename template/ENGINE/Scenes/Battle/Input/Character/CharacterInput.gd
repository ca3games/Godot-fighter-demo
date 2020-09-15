extends Node2D

export (bool) var P1


onready var debugP1 = $"../../LevelManager/Camera2D/P1"
onready var debugP2 = $"../../LevelManager/Camera2D/P2"

var Debug = true

enum Key {
	left, right, up, down, A, B, C, D, X, Y, Z, W, none
}

func GetKeyName(key):
	match (key):
		0: return "LEFT"
		1: return "RIGHT"
		2: return "UP"
		3: return "DOWN"
		4: return "A"
		5: return "B"
		6: return "C"
		7: return "D"
		8: return "X"
		9: return "Y"
		10: return "Z"
		11: return "W"
		12: return "None"


func _physics_process(delta):
	if Input.is_action_just_released("Debug"):
		Debug = !Debug
		ShowDebug()
		
	if P1:
		$InputReader.SetKeyP1()
		$ArrayReader.ReceiveKey($InputReader.key)
		$CommandReader.SelectNewCommand($ArrayReader.Keys)

func AddKey(key):
	if !Debug:
		return
	if P1:
		debugP1.AddKey(key)

func AddTime(time):
	if !Debug:
		return
	if P1:
		debugP1.AddTime(time)

func AddIdle(time):
	if !Debug:
		return
	if P1:
		debugP1.AddIdle(time)


func ShowDebug():
	if Debug:
		debugP1.show()
		debugP2.show()
	else:
		debugP1.hide()
		debugP2.hide()

func ShowCommand(command):
	if !Debug:
		return
	if P1:
		debugP1.ShowCommand(command)
