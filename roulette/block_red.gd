extends RigidBody3D
var bet = 0
@onready var wheel = $"../Block RouletteWheel2"

func interact():
	bet = 2
	print(bet)
	wheel.roll()
	print("interact red")
