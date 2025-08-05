extends RigidBody3D

@export var camera : Camera3D
@onready var game_start = true
@onready var crosshair = $"../CanvasLayer"
@onready var card1 = $"."
var click = false

func ready():
	$CanvasLayer1.hide()

func interact():
	print("Double Damage on your next roll")
	Global.player_damage = 2
	Global.enemy_damage = 2
	click = true
	hide_card()
	#Global.reset_damage()
	# Your interaction logic here
	# Examples:
	# - Open a door
	# - Pick up an item
	# - Start dialogue
	# - Toggle a switch


func show_card():
	crosshair.hide()
	camera.game_start = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$CanvasLayer1.show()
	
func hide_card():
	crosshair.show()
	camera.game_start = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer1.hide()
	if click == true:
		card1.hide()
