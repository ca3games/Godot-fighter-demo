extends Node2D

enum commands {
	idle, walk, walk_b, dash, dash_b, crouch, 
	hop, jump, hyperhop, super_jump,
	hop_f, jump_f, hyperhop_f, super_jump_f,
	hop_b, jump_b, hyperhop_b, super_jump_b,
	WP, SP, WK, SK, MP, MK, NP, NK,
	WP_sus, SP_sus, WK_sus, SK_sus, MP_sus, MK_sus, NP_sus, NK_sus,
	AB, BD, BC, ABC, ABCD, AC, CD,
	QF, QB, DP, DP_B, HCF, HCB, HCFx2, HCBx2, QFHCB, QBHCF,
	
	QF_WK, QB_WK, DP_WK, DP_B_WK, HCF_WK, HCB_WK, HCFx2_WK, HCBx2_WK, QFHCB_WK, QBHCF_WK,
	QF_MK, QB_MK, DP_MK, DP_B_MK, HCF_MK, HCB_MK, HCFx2_MK, HCBx2_MK, QFHCB_MK, QBHCF_MK,
	QF_NK, QB_NK, DP_NK, DP_B_NK, HCF_NK, HCB_NK, HCFx2_NK, HCBx2_NK, QFHCB_NK, QBHCF_NK,
	QF_SK, QB_SK, DP_SK, DP_B_SK, HCF_SK, HCB_SK, HCFx2_SK, HCBx2_SK, QFHCB_SK, QBHCF_SK,
	
	QF_WP, QB_WP, DP_WP, DP_B_WP, HCF_WP, HCB_WP, HCFx2_WP, HCBx2_WP, QFHCB_WP, QBHCF_WP,
	QF_MP, QB_MP, DP_MP, DP_B_MP, HCF_MP, HCB_MP, HCFx2_MP, HCBx2_MP, QFHCB_MP, QBHCF_MP,
	QF_NP, QB_NK, DP_NP, DP_B_NP, HCF_NP, HCB_NP, HCFx2_NP, HCBx2_NP, QFHCB_NP, QBHCF_NP,
	QF_SP, QB_SK, DP_SP, DP_B_SP, HCF_SP, HCB_SP, HCFx2_SP, HCBx2_SP, QFHCB_SP, QBHCF_SP,
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
		
		commands.WK : return "WEAK KICK"
		commands.MK : return "MID KICK"
		commands.SK : return "STRONG KICK"
		commands.WP : return "WEAK PUNCH"
		commands.NK : return "NORMAL KICK"
		commands.NP : return "NORMAL PUNCH"
		commands.MP : return "MID PUNCH"
		commands.SP : return "STRONG PUNCH"
		commands.WK : return "WEAK KICK"
		commands.MK : return "MID KICK"
		commands.SK : return "STRONG KICK"
		commands.WP : return "WEAK PUNCH"
		commands.NK : return "NORMAL KICK"
		commands.NP : return "NORMAL PUNCH"
		commands.MP : return "MID PUNCH"
		commands.SP : return "STRONG PUNCH"
		
		commands.WK_sus : return "WEAK KICK SUS"
		commands.MK_sus : return "MID KICK SUS"
		commands.SK_sus : return "STRONG KICK SUS"
		commands.WP_sus : return "WEAK PUNCH SUS"
		commands.NK_sus : return "NORMAL KICK SUS"
		commands.NP_sus : return "NORMAL PUNCH SUS"
		commands.MP_sus : return "MID PUNCH SUS"
		commands.SP_sus : return "STRONG PUNCH SUS"
		commands.WK_sus : return "WEAK KICK SUS"
		commands.MK_sus : return "MID KICK SUS"
		commands.SK_sus : return "STRONG KICK SUS"
		commands.WP_sus : return "WEAK PUNCH SUS"
		commands.NK_sus : return "NORMAL KICK SUS"
		commands.NP_sus : return "NORMAL PUNCH SUS"
		commands.MP_sus : return "MID PUNCH SUS"
		commands.SP_sus : return "STRONG PUNCH SUS"
		
		commands.AB : return "AB"
		commands.ABC : return "ABC"
		commands.ABCD : return "ABCD"
		commands.BC : return "BC"
		commands.BD : return "BD"
		commands.CD : return "CD"
		commands.AC : return "AC"
		
		commands.QF : return "Quarter Forward"
		commands.QB : return "Quarter Back"
		commands.DP : return "Dragon Punch"
		commands.DP_B : return "Dragon Punch Back"
		commands.HCF : return "Half Circle Forward"
		commands.HCB : return "Half Circle Back"
		commands.HCFx2 : return "2 Half Circle Forward"
		commands.HCBx2 : return "2 Half Circle Back"
		commands.QFHCB : return "Quarter Forward Half Circle Back"
		commands.QBHCF : return "Quarter Back Half Circle Forward"

		commands.QF_WK : return "Quarter Forward WK"
		commands.QB_WK : return "Quarter Back WK"
		commands.DP_WK : return "Dragon Punch WK"
		commands.DP_B_WK : return "Dragon Punch Back WK"
		commands.HCF_WK : return "Half Circle Forward WK"
		commands.HCB_WK : return "Half Circle Back WK"
		commands.HCFx2_WK : return "2 Half Circle Forward WK"
		commands.HCBx2_WK : return "2 Half Circle Back WK"
		commands.QFHCB_WK : return "Quarter Forward Half Circle Back WK"
		commands.QBHCF_WK : return "Quarter Back Half Circle Forward WK"
		
		commands.QF_MK : return "Quarter Forward MK"
		commands.QB_MK : return "Quarter Back MK"
		commands.DP_MK : return "Dragon Punch MK"
		commands.DP_B_MK : return "Dragon Punch Back MK"
		commands.HCF_MK : return "Half Circle Forward MK"
		commands.HCB_MK : return "Half Circle Back MK"
		commands.HCFx2_MK : return "2 Half Circle Forward MK"
		commands.HCBx2_MK : return "2 Half Circle Back MK"
		commands.QFHCB_MK : return "Quarter Forward Half Circle Back MK"
		commands.QBHCF_MK : return "Quarter Back Half Circle Forward MK"
		
		commands.QF_NK : return "Quarter Forward NK"
		commands.QB_NK : return "Quarter Back NK"
		commands.DP_NK : return "Dragon Punch NK"
		commands.DP_B_NK : return "Dragon Punch Back NK"
		commands.HCF_NK : return "Half Circle Forward NK"
		commands.HCB_NK : return "Half Circle Back NK"
		commands.HCFx2_NK : return "2 Half Circle Forward NK"
		commands.HCBx2_NK : return "2 Half Circle Back NK"
		commands.QFHCB_NK : return "Quarter Forward Half Circle Back NK"
		commands.QBHCF_NK : return "Quarter Back Half Circle Forward NK"
	
		commands.QF_SK : return "Quarter Forward SK"
		commands.QB_SK : return "Quarter Back SK"
		commands.DP_SK : return "Dragon Punch SK"
		commands.DP_B_SK : return "Dragon Punch Back SK"
		commands.HCF_SK : return "Half Circle Forward SK"
		commands.HCB_SK : return "Half Circle Back SK"
		commands.HCFx2_SK : return "2 Half Circle Forward SK"
		commands.HCBx2_SK : return "2 Half Circle Back SK"
		commands.QFHCB_SK : return "Quarter Forward Half Circle Back SK"
		commands.QBHCF_SK : return "Quarter Back Half Circle Forward SK"
	
		commands.QF_WP : return "Quarter Forward WP"
		commands.QB_WP : return "Quarter Back WP"
		commands.DP_WP : return "Dragon Punch WP"
		commands.DP_B_WP : return "Dragon Punch Back WP"
		commands.HCF_WP : return "Half Circle Forward WP"
		commands.HCB_WP : return "Half Circle Back WP"
		commands.HCFx2_WP : return "2 Half Circle Forward WP"
		commands.HCBx2_WP : return "2 Half Circle Back WP"
		commands.QFHCB_WP : return "Quarter Forward Half Circle Back WP"
		commands.QBHCF_WP : return "Quarter Back Half Circle Forward WP"
		
		commands.QF_MP : return "Quarter Forward MP"
		commands.QB_MP : return "Quarter Back MP"
		commands.DP_MP : return "Dragon Punch MP"
		commands.DP_B_MP : return "Dragon Punch Back MP"
		commands.HCF_MP : return "Half Circle Forward MP"
		commands.HCB_MP : return "Half Circle Back MP"
		commands.HCFx2_MP : return "2 Half Circle Forward MP"
		commands.HCBx2_MP : return "2 Half Circle Back MP"
		commands.QFHCB_MP : return "Quarter Forward Half Circle Back MP"
		commands.QBHCF_MP : return "Quarter Back Half Circle Forward MP"
		
		commands.QF_NP : return "Quarter Forward NP"
		commands.QB_NP : return "Quarter Back NP"
		commands.DP_NP : return "Dragon Punch NP"
		commands.DP_B_NP : return "Dragon Punch Back NP"
		commands.HCF_NP : return "Half Circle Forward NP"
		commands.HCB_NP : return "Half Circle Back NP"
		commands.HCFx2_NP : return "2 Half Circle Forward NP"
		commands.HCBx2_NP : return "2 Half Circle Back NP"
		commands.QFHCB_NP : return "Quarter Forward Half Circle Back NP"
		commands.QBHCF_NP : return "Quarter Back Half Circle Forward NP"
	
		commands.QF_SP : return "Quarter Forward SP"
		commands.QB_SP : return "Quarter Back SP"
		commands.DP_SP : return "Dragon Punch SP"
		commands.DP_B_SP : return "Dragon Punch Back SP"
		commands.HCF_SP : return "Half Circle Forward SP"
		commands.HCB_SP : return "Half Circle Back SP"
		commands.HCFx2_SP : return "2 Half Circle Forward SP"
		commands.HCBx2_SP : return "2 Half Circle Back SP"
		commands.QFHCB_SP : return "Quarter Forward Half Circle Back SP"
		commands.QBHCF_SP : return "Quarter Back Half Circle Forward SP"



func SelectNewCommand(Keys):
	#DASH
	if Keys[len(Keys)-1].keyID == $"../".Key.left:
		if Keys[len(Keys)-2].keyID == $"../".Key.left and $"../ArrayReader".timeidle < 20:
			last_command = commands.dash_b
		else:
			last_command = commands.walk_b
	if Keys[len(Keys)-1].keyID == $"../".Key.right:
		if Keys[len(Keys)-2].keyID == $"../".Key.right and $"../ArrayReader".timeidle < 20:
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
