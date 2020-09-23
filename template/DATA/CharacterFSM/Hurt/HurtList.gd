extends Node2D

export (String) var Weak
export (String) var Strong
export (String) var Sweep
export (String) var Weak_crouch
export (String) var Strong_crouch
export (String) var air_hit

onready var Root = $"../../"
onready var Attacks = $"../Attacks"

onready var FSM = $"../"

func Hurt(body):
	if body.is_in_group("Character"):
		if body.P1 != Root.P1:
			FSM.Hit()
			FSM.BacktrackHit()
			match(FSM.current.Attack_id):
				0:
					if body.get_node("CharacterFSM").OnAir:
						body.get_node("CharacterFSM").IsJump = true
						body.Hurt(5)
					else:
						body.Hurt(0)
				1:
					if body.get_node("CharacterFSM").OnAir:
						body.get_node("CharacterFSM").IsJump = true
						body.Hurt(5)
					else:
						body.Hurt(1)
