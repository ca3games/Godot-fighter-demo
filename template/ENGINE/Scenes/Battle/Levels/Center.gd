extends Position2D

onready var P1 = $"../../TeamManager/Team"
onready var P2 = $"../../TeamManager/Team2"

func _process(delta):
	var pos = P2.GetPos() - ((P2.GetPos() - P1.GetPos()) / 2) 
	self.position.x = pos.x
