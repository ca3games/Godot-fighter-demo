extends "res://Scripts/Characters/Base/BaseState.gd"

export(Vector2) var Speed
export (String) var AttackName
var start = false

func End():
	FSM.current = $"../IDLE"
	start = false

func Start():
	if !start:
		start = true
		FSM.AnimTree.set(AttackName, true)

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
	
