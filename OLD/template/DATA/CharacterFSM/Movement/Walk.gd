extends Node2D

export (float) var walk_speed
export (String) var Anim

onready var Root = $"../../../"
onready var FSM = $"../../"
onready var Ani = Root.get_node("AnimationPlayer")
onready var Movements = $"../"
onready var Attacks = $"../../Attacks"

func Inputs(delta):
		if FSM.Commands == null:
			return
		
		if Root.P1:
			Commands()

func Commands():
	if !FSM.old_direction:
		if FSM.Fireballs_Number == 0:
			if FSM.Commands.last_button == 10 and FSM.Commands.non_idle_command == 17 :
				if FSM.Commands.button_idle < 50:
					FSM.ChangeState(Attacks.Attacks[2], "Attacks")
					return
	else:
		if FSM.Fireballs_Number == 0:
			if FSM.Commands.last_button == 10 and FSM.Commands.non_idle_command == 16 :
				if FSM.Commands.button_idle < 50:
					FSM.ChangeState(Attacks.Attacks[2], "Attacks")
					return
	
	match(FSM.Commands.last_command):
		0: FSM.ChangeState(Movements.Idle, "Movements", 0)
		1: FSM.ChangeState(Movements.Walk, "Movements", 1)
		2: FSM.ChangeState(Movements.Walk_B, "Movements", 2)
		5: FSM.ChangeState(Movements.Crouch, "Movements")
	
	if FSM.Commands.button_idle < 4:
		match(FSM.Commands.last_button):
			10: FSM.ChangeState(Attacks.Attacks[0], "Attacks")
			11: FSM.ChangeState(Attacks.Attacks[1], "Attacks")
	
	
	
	if FSM.Commands.last_command >= 6 and FSM.Commands.last_command <= 9:
		FSM.ChangeState(Movements.PreJump, "Movements")

func Physics(delta):
	FSM.ResetCombo()
	
	if Ani.current_animation != "Anim":
		Ani.current_animation = Anim
	Root.move_and_slide(Vector2(walk_speed, 0))
	for i in Root.get_slide_count():
		var collision = Root.get_slide_collision(i)
		if collision.collider.is_in_group("Character"):
			collision.collider.Move(Vector2(1, 0))
