extends CanvasLayer

onready var Team1 = $"../TeamManager/Team"

func _process(delta):
	var combo = Team1.Combo
	$Label.text = str(combo) + " COMBO"
