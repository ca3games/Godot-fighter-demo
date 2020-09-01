extends Node2D

onready var Character = preload ("res://ENGINE/Scenes/Battle/TeamLogic/Character/Character.tscn")

func _ready():	
	
	var pos
	if $"../".P1:
		pos = get_tree().get_root().get_node("Battle/LevelManager/P1").position
	else:pos = get_tree().get_root().get_node("Battle/LevelManager/P2").position
		
	
	SpawnCharacter(pos, 0)


func SpawnCharacter(pos, id):
	var name = Variables.get_node("CharacterList").CharacterList[id]
	var chara = load(name).instance()
	chara.position = pos
	$"../".Characters.append(chara)
	$"../".call_deferred("add_child", $"../".Characters[len($"../".Characters)-1])
