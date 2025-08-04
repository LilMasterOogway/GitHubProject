extends RigidBody3D

func ready():
	pass

func interact():
	Global.life_gain = true
	print ("You gain a life instead of the enemy losing one")
	pass
