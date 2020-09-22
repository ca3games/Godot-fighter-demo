extends KinematicBody2D

export (bool) var P1

var Right = false

func _process(delta):
	Right = $"../".Right
