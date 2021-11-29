extends "res://Scripts/Characters/Base/BaseState.gd"

export(int) var damage
export(Vector2) var Speed
export (String) var AttackName
var start = false
export(NodePath) var AnimPlayerPath
onready var AnimPlayer = get_node(AnimPlayerPath)

func End():
	FSM.current = $"../IDLE"
	start = false

func EndHurt():
	FSM.current = $"../IDLE"
	start = false
	FSM.Root.GUI.ResetCombo(FSM.Root.P1)

func Start():
	if !start:
		start = true
		FSM.AnimTree.set(AttackName, true)
		FSM.AttackHitbox.damage = damage
		FSM.AnimTree.set("parameters/Seek/seek_position", 0)

func Update(delta):
	Start()

func Physics(delta):
	var s = 0
	if FSM.sideright:
		s = 1
	else:
		s = -1
	var dir = Vector3(s * delta * Speed.x, 0, s * delta * Speed.y)
	FSM.Root.move_and_collide(dir, false)
	
