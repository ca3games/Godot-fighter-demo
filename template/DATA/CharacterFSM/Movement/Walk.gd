extends Node2D

export (float) var walk_speed
export (String) var Anim

func Inputs(delta):
		if $"../".Commands.last_command == 5:
			if $"../Movements".Idle != null:
				$"../".ChangeState($"../Movements".Idle)
		if $"../".Commands.last_command == 1:
			if $"../Movements".Walk != null:
				$"../".ChangeState($"../Movements".Walk)
		if $"../".Commands.last_command == 2:
			if $"../Movements".Walk_B != null:
				$"../".ChangeState($"../Movements".Walk_B)

func Physics(delta):
	if $"../".AnimPlayer.current_animation != "Anim":
		$"../".AnimPlayer.current_animation = Anim
	$"../../".move_and_slide(Vector2(walk_speed, 0))
