extends Node2D

onready var Character = preload ("res://ENGINE/Scenes/Battle/TeamLogic/Character/Character.tscn")

func _ready():	
	var pos = get_tree().get_root().get_node("Battle/LevelManager/P1").position
	
	SpawnCharacter(pos, 0)


func SpawnCharacter(pos, id):
	var name = Variables.get_node("CharacterList").CharacterList[id]
	var chara = load(name).instance()
	chara.position = pos
	$"../".call_deferred("add_child", chara)
