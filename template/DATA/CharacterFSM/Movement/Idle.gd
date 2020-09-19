extends Node2D

export (String) var Anim

func Inputs(delta):
	
	if $"../".Commands == null:
		return
	match($"../".Commands.last_command):
		1:
			if $"../Movements".Walk != null:
				$"../".ChangeState($"../Movements".Walk)
			else:
				print("Walk is null")
		2:
			if $"../Movements".Walk_B != null:
				$"../".ChangeState($"../Movements".Walk_B)
			else:
				print("Walk B is null")
		6:
			if $"../Movements".Hop != null:
				$"../".IsJump = true
				$"../".ChangeState($"../Movements".Hop)
			else:
				print("Hop is null")
		_: print($"../".Commands.last_command)
	
func Physics(delta):
	if $"../".AnimPlayer.current_animation != "Anim":
		$"../".AnimPlayer.current_animation = Anim
