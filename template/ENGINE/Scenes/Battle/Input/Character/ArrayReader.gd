extends Node2D

onready var Key = load("res://ENGINE/Scenes/Battle/Input/Character/Key.gd")

var Keys = []
var timeidle = 0

func _ready():
	for i in range(8):
		AddDummyInput()
	
func AddDummyInput():
	var key = Key.new()
	key.keyID = $"../".Key.none
	Keys.append(key)

func ReceiveKey(new_key):
	if new_key != $"../".Key.none:
		if new_key == Keys[len(Keys)-1].keyID:
			if timeidle > 3:
				AddKey(new_key)
			else: 
				Keys[len(Keys)-1].timepressed += 1
		else:
			AddKey(new_key)
	else:
		timeidle += 1
		if timeidle > 20:
			AddKey(new_key)
	
func AddKey(new_key):
	var key = Key.new()
	key.keyID = new_key
	Keys.append(key)
	$"../".AddKey( $"../".GetKeyName(Keys[len(Keys)-1].keyID))
	
	if len(Keys) > 10:
		Keys.remove(0)
	timeidle = 0
