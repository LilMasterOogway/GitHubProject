extends RigidBody3D
var bet = 0
@export var wheel : Node3D

func interact():
	bet = 1
	wheel.roll(bet)
	
	
