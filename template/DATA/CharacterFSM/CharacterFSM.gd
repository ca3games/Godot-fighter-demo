extends Node2D

onready var current = $Movements/Idle
var IsJump = false
var Direction = 0

var ArrayReader
var Commands
onready var AnimPlayer = $"../AnimationPlayer"

func _ready():
	if $"../".P1:
		ArrayReader = $"../../../../InputManager/CharacterInput/ArrayReader"
		Commands = $"../../../../InputManager/CharacterInput/CommandReader"
	else:
		ArrayReader = $"../../../../InputManager/CharacterInput2/ArrayReader"
		Commands = $"../../../../InputManager/CharacterInput2/CommandReader"

func _physics_process(delta):
	current.Inputs(delta)
	current.Physics(delta)
	
		
func ChangeState(state, parent, direction = 9):
	print(direction)
	current = get_node(parent + "/" + state)
	if direction != 9:
		Direction = direction
		print(Direction)
