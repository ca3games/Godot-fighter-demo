extends Node2D

onready var current = $Movements/Idle
var IsJump = false
var Direction = 0
onready var Root = $"../"
var flip = false
var old_direction = false
var OnAir = false
var Combo = 0
var Fireballs_Number = 0

var ArrayReader
var Commands
onready var AnimPlayer = $"../AnimationPlayer"
var LastAttack = 1


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
	
func BacktrackHit():
	if old_direction:
		Root.move_and_collide(Vector2(Variables.get_node("EngineData").HitOffset, 0))
	else:
		Root.move_and_collide(Vector2(-Variables.get_node("EngineData").HitOffset, 0))
	
func Hit():
	$"../../".AddHit()

func ResetCombo():
	$"../../".ResetCombo()
