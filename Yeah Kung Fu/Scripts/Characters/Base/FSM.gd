extends Node

export (NodePath) var ModelPath
onready var Model = get_node(ModelPath)
export(NodePath) var RootPath
onready var Root = get_node(RootPath)
export(NodePath) var AnimTreePath
onready var AnimTree = get_node(AnimTreePath)
export(NodePath) var AttackHitboxPath
onready var AttackHitbox = get_node(AttackHitboxPath)

onready var current = $IDLE
var sideright = false

func _process(delta):
	if is_instance_valid(current):
		current.Update(delta)

func _physics_process(delta):
	if is_instance_valid(current):
		current.Physics(delta)


func ChangeState(state):
	current = state
