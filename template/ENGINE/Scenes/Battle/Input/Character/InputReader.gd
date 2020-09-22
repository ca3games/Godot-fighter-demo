extends Node2D

onready var key = $"../".Key.none
onready var button = $"../".Key.none

func SetKeyP1():
	key = KeyInputP1()
	button = ButtonInputP1()

func SetKeyP2():
	key = KeyInputP2()
	button = ButtonInputP2()

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

func ButtonInputP1():
	var k = $"../".Key.none
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

func KeyInputP2():
	var k = $"../".Key.none
	
	if Input.is_action_pressed("P2Left"):
		k = $"../".Key.left
	if Input.is_action_pressed("P2Right"):
		k = $"../".Key.right
	if Input.is_action_pressed("P2Up"):
		k = $"../".Key.up
	if Input.is_action_pressed("P2Down"):
		k = $"../".Key.down
	
	return k


func ButtonInputP2():
	var k = $"../".Key.none
	if Input.is_action_pressed("AP2"):
		k = $"../".Key.A
	if Input.is_action_pressed("BP2"):
		k = $"../".Key.B
	if Input.is_action_pressed("CP2"):
		k = $"../".Key.C
	if Input.is_action_pressed("DP2"):
		k = $"../".Key.D
	if Input.is_action_pressed("XP2"):
		k = $"../".Key.X
	if Input.is_action_pressed("YP2"):
		k = $"../".Key.Y
	if Input.is_action_pressed("ZP2"):
		k = $"../".Key.Z
	if Input.is_action_pressed("WP2"):
		k = $"../".Key.W
	return k
