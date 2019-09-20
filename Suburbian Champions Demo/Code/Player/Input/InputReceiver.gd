extends Node2D

#THIS SCRIPT TAKES THE INPUT FROM THE KEYBOARD
#LISTADD TAKES THIS INPUT FOR IT'S BUFFER INPUT LIST

onready var Root = $"../../"

#script that manages the list of key inputs added
onready var list = $"../ListAdd"
enum keys {
	none, left, right, punch, spunch
	}
	
#code needs to turn on and turn off keys to be able to keep pressed
#a key without being actived by all the input events
var left_pressed = false
var right_pressed = false
var punch_pressed = false
var spunch_pressed = false
#current key
var current
#take an AI decission after a timer
var decision

func _ready():
	if !Root.P1:
		$"../../AI".start(1)

func _process(delta):
	
	if !Root.idle:
		return
	
	var left = false
	var right = false
	current = keys.none

	if Root.P1:	
		if Input.is_action_pressed("LEFTP1"):
			left = true
			left_pressed = true
		if Input.is_action_pressed("RIGHTP1"):
			right = true
			right_pressed = true
		
		if Input.is_action_just_released("PUNCHP1"):
			current = keys.punch
		if Input.is_action_just_released("SPUNCHP1"):
			current = keys.spunch
		
		if Input.is_action_just_released("LEFTP1"):
			left_pressed = false
		if Input.is_action_just_released("RIGHTP1"):
			right_pressed = false
	else:
		#Take decision from AI
		if decision:
			decision = false
			
			#Choose what to do
			var tmp = rand_range(1, 4)
			if tmp < 2:
				left = true
				left_pressed = true
			elif tmp > 3:
				right = true
				right_pressed = true
			else:
				AddEmptyCommand()
	
	#if there's not direction button pressed, add empty key
	if !left_pressed and !right_pressed:
		list.AddEmpty()
	
	if left and not right:
		current = keys.left
	if right and not left:
		current = keys.right
	
	#if current is diferent to none key pressed add the key
	if current != keys.none:
		list.AddKey(current)
	
	#add time pressed
	list.KeyboardPressed()
	
# if AI has no input
func AddEmptyCommand():
	list.AddNone()

func _input(event):
	#reset list pressed time to 0
	list.none["pressed_time"] = 0

#AI Take a decision
func _on_AI_timeout():
	$"../../AI".start(rand_range(0.5, 2))
	decision = true
