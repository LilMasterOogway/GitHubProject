extends RigidBody3D

func interact():
	print("Double Damage on your next roll")
	Global.player_damage = 2
	Global.enemy_damage = 2
	#Global.reset_damage()
	# Your interaction logic here
	# Examples:
	# - Open a door
	# - Pick up an item
	# - Start dialogue
	# - Toggle a switch
