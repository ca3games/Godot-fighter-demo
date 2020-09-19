extends Node2D

onready var Character = preload ("res://ENGINE/Scenes/Battle/TeamLogic/Character/Character.tscn")

func _ready():	
	
	var pos
	var isP1
	if $"../".P1:
		pos = get_tree().get_root().get_node("Battle/LevelManager/P1").position
		isP1 = true
	else:
		pos = get_tree().get_root().get_node("Battle/LevelManager/P2").position
		isP1 = false
		
	
	SpawnCharacter(pos, 0, isP1)


func SpawnCharacter(pos, id, P1):
	var name = Variables.get_node("CharacterList").CharacterList[id]
	var chara = load(name).instance()
	chara.position = pos
	chara.P1 = P1
	$"../".Characters.append(chara)
	$"../".call_deferred("add_child", $"../".Characters[len($"../".Characters)-1])
