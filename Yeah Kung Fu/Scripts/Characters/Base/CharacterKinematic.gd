extends KinematicBody

export (bool) var P1

func SetSide(side, start):
	if start:
		$FSM/Variables.SetRightStart(side)
	else:
		$FSM/Variables.SetSideRight(side)
