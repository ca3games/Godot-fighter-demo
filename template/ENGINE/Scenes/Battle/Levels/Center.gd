extends Position2D

onready var P1 = $"../../TeamManager/Team"
onready var P2 = $"../../TeamManager/Team2"

onready var Left = $"../Left"
onready var Right = $"../Right"

func _process(delta):
	var pos = P2.GetPos() - ((P2.GetPos() - P1.GetPos()) / 2) 
	self.position.x = pos.x
	
	if self.position.x < Left.position.x :
		position.x = Left.position.x
	
	if self.position.x > Right.position.x :
		position.x = Right.position.x
