extends Node2D


func _ready():
	$OverHP.value = 100
	$BehindRed.value = 100

func Hit(damage):
	$OverHP.value -= damage
	$RedBarReset.start(2)

	


func _on_RedBarReset_timeout():
	$Red.interpolate_property($BehindRed, "value", $BehindRed.value, $OverHP.value, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Red.start()
