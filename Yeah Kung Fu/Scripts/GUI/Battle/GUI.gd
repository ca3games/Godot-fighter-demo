extends Node2D

onready var combo1p = 0
onready var combo2p = 0


func _ready():
	ResetCombo(true)
	ResetCombo(false)


func ResetCombo(P1):
	if P1:
		combo1p = 0
		$P1Hit.text = str(combo1p)
		$P1Hit.hide()
	else:
		combo2p = 0
		$P2Hit.text = str(combo1p)
		$P2Hit.hide()

func Hit(damage, P1):
	if P1:
		$PlayerGUI.Hit(damage)
		combo1p += 1
		$P1Hit.text = str(combo1p) +  " HIT"
		$P1Hit.show()
	else:
		$PlayerGUI2.Hit(damage)
		combo2p += 1
		$P2Hit.text = str(combo2p)  +  " HIT"
		$P2Hit.show()
