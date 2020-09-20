extends Node2D

onready var Key = load("res://ENGINE/Scenes/Battle/Input/Character/Key.gd")

var Keys = []
var timeidle = 0
var last_button
var time_buttons_idle = 0

func _ready():
	for i in range(8):
		AddDummyInput()
	last_button = $"../".Key.none
	
func AddDummyInput():
	var key = Key.new()
	key.keyID = $"../".Key.none
	Keys.append(key)

func ReceiveKey(new_key, new_button):
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
		$"../".AddIdle(timeidle)
		if timeidle > 10 and Keys[len(Keys)-1].keyID != $"../".Key.none:
			AddKey(new_key)
	
	if  new_button != $"../".Key.none:
		if new_button != last_button:
			last_button = new_button
			time_buttons_idle = 0
			$"../".AddKey($"../".GetKeyName(last_button))
		else:
			if time_buttons_idle > 3:
				time_buttons_idle = 0
				$"../".AddKey($"../".GetKeyName(last_button))
	else:
		time_buttons_idle += 1
		
		$"../".AddButtonIdle(time_buttons_idle)
		
		if time_buttons_idle > 99:
			time_buttons_idle = 99
	
func AddKey(new_key):
	var key = Key.new()
	key.keyID = new_key
	Keys.append(key)
	$"../".AddKey( $"../".GetKeyName(Keys[len(Keys)-1].keyID))
	
	if len(Keys) > 10:
		Keys.remove(0)
	timeidle = 0
