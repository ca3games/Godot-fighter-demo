extends Node2D

onready var Key = load("res://ENGINE/Scenes/Battle/Input/Character/Key.gd")

var Keys
var timeidle = 0

func _ready():
	
	var key = Key.new()
	key.keyID = $"../".Key.none
	
	Keys = []
	Keys.append(key)

func ReceiveKey(new_key):
	if new_key != $"../".Key.none:
		print(Keys[0].timepressed)
		if new_key == Keys[len(Keys)-1].keyID:
			if timeidle > 8:
				AddKey(new_key)
			else:
				Keys[0].timepressed += 1
				$"../".AddTime(Keys[0].timepressed)
		else:
			AddKey(new_key)
	else:
		if timeidle > 999999:
			999999
		
		timeidle += 1
		$"../".AddIdle(timeidle)

func AddKey(new_key):
	timeidle = 0
	var key = Key.new()
	key.keyID = new_key
	Keys.append(key)
	$"../".AddKey( $"../".GetKeyName(Keys[0].keyID))
	
	if len(Keys) > 10:
		Keys.remove(0)
