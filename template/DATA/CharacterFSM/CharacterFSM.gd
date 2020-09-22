extends Node2D

onready var current = $Movements/Idle
var IsJump = false
var Direction = 0
onready var Root = $"../"
var flip = false
var old_direction = false

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
	if old_direction != Root.Right:
		old_direction = Root.Right
		Root.scale.x *= -1

	current.Inputs(delta)
	current.Physics(delta)
	
func ChangeState(state, parent, direction = 9):
	current = get_node(parent + "/" + state)
	if direction != 9:
		Direction = direction

func Flip():
	Root.scale.x *= -1
	
