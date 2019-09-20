extends Control

var inputs

func _ready():
	 inputs = get_node("GUI/inputs")

func Pressed_Time(key):
	inputs.get_child(0).get_child(1).text = str(key.pressed_time)

func UpdateIdle(time):
	$GUI/Box/idle.text = "idle : " + str(time)

func UpdateMove(text):
	$GUI/Box/move.text = text

func UpdateCommand(text):
	$GUI/Box/command.text = text

func UpdateList(key):
	var k = Label.new()
	k.text = str(key.key) 
	var t = Label.new()
	t.text = str(key.pressed_time)
	var container = HBoxContainer.new()
	container.add_child(k)
	container.add_child(t)
	if inputs == null:
		inputs = get_node("GUI/inputs")
	inputs.add_child(container)
	inputs.move_child(container, 0)
	
	var size = inputs.get_child_count()
	if size > 10:
		inputs.get_child(inputs.get_child_count()-1).queue_free()