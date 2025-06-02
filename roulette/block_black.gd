extends RigidBody3D
var bet = 0
@onready var wheel = $"../BlockRouletteWheel"

func interact():
	bet = 1
	print("interact black")
	print(bet)
	wheel.roll()
	
	
