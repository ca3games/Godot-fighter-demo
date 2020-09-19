extends Node2D

export (String) var Anim

export (Vector2) var JumpForce
var force

func Inputs(delta):
	pass

func Physics(delta):
	if $"../".IsJump:
		force = JumpForce
		$"../".IsJump = false
	
	print(force)

	if $"../".AnimPlayer.current_animation != "Anim":
		$"../".AnimPlayer.current_animation = Anim
		
	force.y += $"../../".Gravity
	if force.y > $"../../".MaxGravity:
		force.y = $"../../".MaxGravity
	
	$"../../".move_and_slide(force)
	for i in $"../../".get_slide_count():
		var collision = $"../../".get_slide_collision(i)
		if collision.collider.is_in_group("Ground"):
			if $"../Movements".Idle != null:
				$"../".ChangeState($"../Movements".Idle)
