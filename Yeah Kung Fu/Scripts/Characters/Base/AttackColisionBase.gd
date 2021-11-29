extends Area

#IT NEEDS THE EMPTY SPATIAL PARENT OF THE MODEL TO CHECK FOR THE NAME OF IT


enum type { weak, strong }

onready var attacktype = type.weak
onready var damage = 0

func _on_Area_body_entered(body):
	if body.get_parent().name != $"../".get_parent().name:
		match (attacktype):
			type.weak : body.Hurt(damage, "WEAK")
