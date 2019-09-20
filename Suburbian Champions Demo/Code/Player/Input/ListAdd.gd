extends Node2D

#THIS NODE ADDS THE INPUT TO THE INPUT LIST

onready var input = $"../InputReceiver"
onready var P1GUI = $"../../../GUI/P1inputs"
onready var root = $"../../"

var button = {
	"key" : 0,
	"pressed_time" : 0
	}

var keys = []

#var to check if there's not input
var none

func _ready():
	var tmp = button.duplicate(true)
	var tmp2 = button.duplicate(true)
	keys.insert(0, tmp)
	keys.insert(0, tmp2)
	P1GUI.UpdateList(keys[0])
	
	none = button.duplicate(true)

func AddEmpty():
	if input.left_pressed or input.right_pressed:
		none["pressed_time"] = 0
	else:
		if none["pressed_time"] > 10:
			P1GUI.UpdateIdle(none["pressed_time"])
		none["pressed_time"] += 1
	if none["pressed_time"] > 8:
		AddNone()


func AddNone():
	if keys[0].key != 0:
		var tmp = button.duplicate(true)
		tmp.key = 0
		tmp.pressed_time = 0
		keys.insert(0, tmp)
		
		if len(keys) > 10:
			keys.remove(len(keys)-1)
		P1GUI.UpdateList(keys[0])


func AddKey(key):
	none["pressed_time"] = 0
	#0 == none
	if key != keys[0].key or key == 3 or key == 4:
		var tmp = button.duplicate(true)
		tmp.key = key
		tmp.pressed_time = 0
		keys.insert(0, tmp)
	
		if len(keys) > 10:
			keys.remove(len(keys)-1)
		P1GUI.UpdateList(keys[0])

func KeyboardPressed():
	if keys[0].key == 1 and input.left_pressed:
		AddTimePress()
	if keys[0].key == 2 and input.right_pressed:
		AddTimePress()

func AddTimePress():
	keys[0].pressed_time += 1
	P1GUI.Pressed_Time(keys[0])
	none["pressed_time"] = 0
	P1GUI.UpdateIdle(none["pressed_time"])