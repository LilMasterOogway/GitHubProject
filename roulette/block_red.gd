extends RigidBody3D
var bet = 0
@export var wheel : Node3D

func pick_color():
	bet = 2
	wheel.roll(bet)
	
