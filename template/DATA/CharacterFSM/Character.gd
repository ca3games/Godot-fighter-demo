extends KinematicBody2D

export (bool) var P1

var Right = false

func _process(delta):
	Right = $"../".Right

func Hurt(id):
	match(id):
		0 : $"CharacterFSM".ChangeState($"CharacterFSM/Hurt".Weak, "Hurt")
		5 : $"CharacterFSM".ChangeState($"CharacterFSM/Hurt".air_hit, "Hurt")
