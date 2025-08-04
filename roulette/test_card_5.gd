extends RigidBody3D

func ready():
	pass

func interact():
	Global.life_plus()
	print ("You gain a life")
