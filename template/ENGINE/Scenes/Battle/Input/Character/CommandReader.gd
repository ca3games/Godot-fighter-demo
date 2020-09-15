extends Node2D

enum commands {
	idle, walk, walk_b, dash, dash_b, crouch, 
	hop, jump, hyperhop, super_jump,
	hop_f, jump_f, hyperhop_f, super_jump_f,
	hop_b, jump_b, hyperhop_b, super_jump_b,
}

var last_command = commands.idle

func GetCommandName():
	match(last_command):
		commands.idle : return "IDLE"
		commands.walk : return "WALK"
		commands.walk_b : return "WALK BACK"
		commands.dash : return "DASH"
		commands.dash_b : return "DASH BACK"
		commands.crouch : return "CROUCH"
		
		commands.hop : return "HOP"
		commands.jump : return "JUMP"
		commands.hyperhop : return "HYPER HOP"
		commands.super_jump : return "SUPER JUMP"
		commands.hop_f : return "HOP F"
		commands.jump_f : return "JUMP F"
		commands.hyperhop_f : return "HYPER HOP F"
		commands.super_jump_f : return "SUPER JUMP F"
		commands.hop_b : return "HOP B"
		commands.jump_b : return "JUMP B"
		commands.hyperhop_b : return "HYPER HOP B"
		commands.super_jump_b : return "SUPER JUMP B"


func SelectNewCommand(Keys):
	#DASH
	if Keys[len(Keys)-1].keyID == $"../".Key.left:
		if Keys[len(Keys)-2].keyID == $"../".Key.left:
			last_command = commands.dash_b
		else:
			last_command = commands.walk_b
	if Keys[len(Keys)-1].keyID == $"../".Key.right:
		if Keys[len(Keys)-2].keyID == $"../".Key.right:
			last_command = commands.dash
		else:
			last_command = commands.walk
	
	#MOVE
	if Keys[len(Keys)-1].keyID == $"../".Key.none:
		last_command = commands.idle
		last_command = commands.crouch
	
	# JUMP
		
	if Keys[len(Keys)-3].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed < 7:
		last_command = commands.hop
	if Keys[len(Keys)-3].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed > 8:
		last_command = commands.jump
	if Keys[len(Keys)-2].keyID == $"../".Key.down and Keys[len(Keys)-3].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed < 10:
		last_command = commands.super_jump
		
	#HOP F
	if Keys[len(Keys)-2].keyID == $"../".Key.right and Keys[len(Keys)-3].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed < 7:
		last_command = commands.hop
	if Keys[len(Keys)-2].keyID == $"../".Key.right and Keys[len(Keys)-3].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed > 8:
		last_command = commands.jump
	if Keys[len(Keys)-2].keyID == $"../".Key.right and Keys[len(Keys)-3].keyID == $"../".Key.down and Keys[len(Keys)-3].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed < 10:
		last_command = commands.super_jump
	
	#HOP F
	if Keys[len(Keys)-3].keyID == $"../".Key.right and Keys[len(Keys)-2].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed < 7:
		last_command = commands.hop
	if Keys[len(Keys)-3].keyID == $"../".Key.right and Keys[len(Keys)-2].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed > 8:
		last_command = commands.jump
	if Keys[len(Keys)-3].keyID == $"../".Key.right and Keys[len(Keys)-3].keyID == $"../".Key.down and Keys[len(Keys)-2].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed < 10:
		last_command = commands.super_jump

	#HOP F
	if Keys[len(Keys)-2].keyID == $"../".Key.right and Keys[len(Keys)-3].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed < 7:
		last_command = commands.hop_f
	if Keys[len(Keys)-2].keyID == $"../".Key.right and Keys[len(Keys)-3].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed > 8:
		last_command = commands.jump_f
	if Keys[len(Keys)-2].keyID == $"../".Key.right and Keys[len(Keys)-3].keyID == $"../".Key.down and Keys[len(Keys)-3].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed < 10:
		last_command = commands.super_jump_f
		
	#HOP B
	if Keys[len(Keys)-3].keyID == $"../".Key.left and Keys[len(Keys)-2].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed < 7:
		last_command = commands.hop_b
	if Keys[len(Keys)-3].keyID == $"../".Key.left and Keys[len(Keys)-2].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed > 8:
		last_command = commands.jump_b
	if Keys[len(Keys)-3].keyID == $"../".Key.left and Keys[len(Keys)-3].keyID == $"../".Key.down and Keys[len(Keys)-2].keyID == $"../".Key.up and Keys[len(Keys)-3].timepressed < 10:
		last_command = commands.super_jump_b
		
	#HYPER HOP
	if Keys[len(Keys)-3].keyID == $"../".Key.left and Keys[len(Keys)-2].keyID == $"../".Key.left and Keys[len(Keys)-3].keyID == $"../".Key.up:
		last_command = commands.hyperhop_b
	if Keys[len(Keys)-3].keyID == $"../".Key.right and Keys[len(Keys)-2].keyID == $"../".Key.right and Keys[len(Keys)-3].keyID == $"../".Key.up:
		last_command = commands.hyperhop_f

	$"../".ShowCommand(GetCommandName())
