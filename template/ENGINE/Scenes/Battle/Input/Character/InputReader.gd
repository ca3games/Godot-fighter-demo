extends Node2D

onready var key = $"../".Key.none


func _process(delta):
	if $"../".P1:
		key = KeyInputP1()
		$"../ArrayReader".ReceiveKey(key)


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
	if Input.is_action_pressed("AP1"):
		k = $"../".Key.A
	if Input.is_action_pressed("BP1"):
		k = $"../".Key.B
	if Input.is_action_pressed("CP1"):
		k = $"../".Key.C
	if Input.is_action_pressed("DP1"):
		k = $"../".Key.D
	if Input.is_action_pressed("XP1"):
		k = $"../".Key.X
	if Input.is_action_pressed("YP1"):
		k = $"../".Key.Y
	if Input.is_action_pressed("ZP1"):
		k = $"../".Key.Z
	if Input.is_action_pressed("WP1"):
		k = $"../".Key.W
	return k
