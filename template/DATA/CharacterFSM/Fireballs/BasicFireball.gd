extends KinematicBody2D

var P1
var Hurt_id = 1
var Parent_Root

export (Vector2) var speed

func _physics_process(delta):
	move_and_collide(speed)


func _on_Area2D_body_entered(body):
	if P1:
		if body.is_in_group("Character"):
			if !body.P1:
				Parent_Root.Fireballs_Number -= 1
				body.Hurt(Hurt_id)
				queue_free()
		if body.is_in_group("OffScreen"):
			Parent_Root.Fireballs_Number -= 1
			queue_free()
