extends Camera2D

export (float) var speed_camera
export (float) var camera_boundaries
export (float) var camera_3D_speed

func _process(delta):
	var distance = abs($"../Center".position.x - position.x)
	
	if distance > camera_boundaries:
		if $"../Center".position.x < position.x:
				self.position.x -= speed_camera
				$"../ViewportContainer/Viewport/Level".Move(-camera_3D_speed)
		else:
			self.position.x += speed_camera
			$"../ViewportContainer/Viewport/Level".Move(camera_3D_speed)
