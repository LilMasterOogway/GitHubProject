extends RigidBody3D

func ready():
	$CanvasLayer.hide()

func interact():
	print("Double Damage on your next roll")
	Global.player_damage = 2
	Global.enemy_damage = 2
	hide_card()
	#Global.reset_damage()
	# Your interaction logic here
	# Examples:
	# - Open a door
	# - Pick up an item
	# - Start dialogue
	# - Toggle a switch


func show_card():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$CanvasLayer.show()
	
func hide_card():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer.hide()
