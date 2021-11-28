extends Control


func AddKey(key):
	var label = Label.new()
	label.text = str(key)
	$Debug.add_child(label)
	
	var size = $Debug.get_child_count()
	if size > 10:
		$Debug.remove_child($Debug.get_child(0))

func AddTime(time):
	$Info/Info/Pressed.text = str(time)

func AddButtonIdle(time):
	$Info/Info4/LastButton.text = str(time)

func AddIdle(time):
	$Info/Info2/Idle.text = str(time)

func ShowCommand(command):
	$Info/Info3/LastCommand.text = str(command)
