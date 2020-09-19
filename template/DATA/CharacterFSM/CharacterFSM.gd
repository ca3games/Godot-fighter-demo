extends Node2D

onready var current = $Idle
var IsJump = false

var ArrayReader
var Commands
onready var AnimPlayer = $"../AnimationPlayer"

func _ready():
	if $"../".P1:
		ArrayReader = $"../../../../InputManager/CharacterInput/ArrayReader"
		Commands = $"../../../../InputManager/CharacterInput/CommandReader"

func _physics_process(delta):
	if current != null:
		current.Inputs(delta)
	if current != null:
		current.Physics(delta)

func ChangeState(state):
	current = get_node(state)
