extends Node

export (float) var SideAngle

func SetSideRight(side):
	if $"../".sideright != side:
		$"../".sideright = side
		if side:
			$"../".Model.rotation_degrees.y = SideAngle
		else:
			$"../".Model.rotation_degrees.y = -SideAngle

func SetRightStart(side):
	$"../".sideright = side
	if side:
		$"../".Model.rotation_degrees.y = SideAngle
	else:
		$"../".Model.rotation_degrees.y = -SideAngle
