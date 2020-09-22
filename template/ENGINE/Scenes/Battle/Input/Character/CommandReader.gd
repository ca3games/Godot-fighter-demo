extends Node2D

enum commands {
	idle, walk, walk_b, dash, dash_b, crouch, 
	hop, jump, super_jump, super_hop
}

var last_command = commands.idle
var non_idle_command = last_command

func GetCommandName(command):
	match(command):
		0 : return "IDLE"
		1 : return "WALK"
		2 : return "WALK BACK"
		3 : return "DASH"
		4 : return "DASH BACK"
		5 : return "CROUCH"
		
		6 : return "HOP"
		7 : return "JUMP"
		8 : return "SUPER JUMP"
		9: return "SUPER HOP"


func SelectNewCommand(Keys):
	
	if Keys[len(Keys)-1].keyID == $"../".Key.down:
		last_command = commands.crouch
	
	
	#DASH
	if Keys[len(Keys)-1].keyID == $"../".Key.left:
		if Keys[len(Keys)-2].keyID == $"../".Key.left:
			if $"../".Right:
				last_command = commands.dash_b
			else:
				last_command = commands.dash
		else:
				last_command = commands.walk_b
	if Keys[len(Keys)-1].keyID == $"../".Key.right:
		if Keys[len(Keys)-2].keyID == $"../".Key.right:
			if $"../".Right:
				last_command = commands.dash
			else:
				last_command = commands.dash_b
		else:
			last_command = commands.walk
	
	#MOVE
	if Keys[len(Keys)-1].keyID == $"../".Key.none:
		last_command = commands.idle
	
	# JUMP
		
	if Keys[len(Keys)-1].keyID == $"../".Key.up and Keys[len(Keys)-1].timepressed < 7:
		last_command = commands.hop
	if Keys[len(Keys)-1].keyID == $"../".Key.up and Keys[len(Keys)-1].timepressed > 8:
		last_command = commands.jump
	if Keys[len(Keys)-2].keyID == $"../".Key.down and Keys[len(Keys)-1].keyID == $"../".Key.up and Keys[len(Keys)-1].timepressed < 10:
		last_command = commands.super_jump
		
	#JUMP F
	if Keys[len(Keys)-2].keyID == $"../".Key.right and Keys[len(Keys)-1].keyID == $"../".Key.up and Keys[len(Keys)-1].timepressed < 7:
		last_command = commands.hop
	if Keys[len(Keys)-2].keyID == $"../".Key.right and Keys[len(Keys)-1].keyID == $"../".Key.up and Keys[len(Keys)-1].timepressed > 8:
		last_command = commands.jump
	if Keys[len(Keys)-3].keyID == $"../".Key.down and Keys[len(Keys)-2].keyID == $"../".Key.right and Keys[len(Keys)-1].keyID == $"../".Key.up and Keys[len(Keys)-1].timepressed < 10:
		last_command = commands.super_jump
	if Keys[len(Keys)-3].keyID == $"../".Key.right and Keys[len(Keys)-2].keyID == $"../".Key.up and Keys[len(Keys)-1].keyID == $"../".Key.none and $"../ArrayReader".timeidle < 5:
		last_command = commands.hop
	
	#JUMP B
	if Keys[len(Keys)-2].keyID == $"../".Key.left and Keys[len(Keys)-1].keyID == $"../".Key.up and Keys[len(Keys)-1].timepressed < 7:
		last_command = commands.hop
	if Keys[len(Keys)-2].keyID == $"../".Key.left and Keys[len(Keys)-1].keyID == $"../".Key.up and Keys[len(Keys)-1].timepressed > 8:
		last_command = commands.jump
	if Keys[len(Keys)-3].keyID == $"../".Key.down and Keys[len(Keys)-2].keyID == $"../".Key.left and Keys[len(Keys)-1].keyID == $"../".Key.up and Keys[len(Keys)-1].timepressed < 10:
		last_command = commands.super_jump
	if Keys[len(Keys)-3].keyID == $"../".Key.left and Keys[len(Keys)-2].keyID == $"../".Key.up and Keys[len(Keys)-1].keyID == $"../".Key.none and $"../ArrayReader".timeidle < 5:
		last_command = commands.hop
	
	if last_command != 0:
		non_idle_command = last_command

	$"../".ShowCommand(GetCommandName(non_idle_command))
