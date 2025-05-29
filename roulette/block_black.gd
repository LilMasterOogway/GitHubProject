extends RigidBody3D
var bet = 0
@onready var wheel = $"../Block RouletteWheel2"
func interact():
	bet = 1
	print("interact black")
	print(bet)
	wheel.roll()
	
	
