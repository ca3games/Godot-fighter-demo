extends Node2D

export (String) var Anim
export (int) var Attack_id
export (String) var Fireball_file

onready var Root = $"../../../"
onready var FSM = $"../../"
onready var Ani = Root.get_node("AnimationPlayer")
onready var Movements = $"../../Movements"

func Inputs(delta):
	pass
	
func Physics(delta):
	if Ani.current_animation != "Anim":
		Ani.current_animation = Anim
		
func EndAnim():
	FSM.ChangeState(Movements.Idle, "Movements")
	
func SpawnFireball():
	var tmp = load(Fireball_file)
	var fireball = tmp.instance()
	fireball.P1 = Root.P1
	fireball.Hurt_id = Attack_id
	fireball.Parent_Root = FSM
	if FSM.old_direction:
		fireball.speed *= -1
	fireball.position = Root.get_node("FireballSpawn").global_position
	Root.FireballManager.add_child(fireball)
	FSM.Fireballs_Number += 1

