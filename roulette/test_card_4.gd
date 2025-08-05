extends RigidBody3D

@export var camera : Camera3D
@onready var game_start = true
@onready var crosshair = $"../CanvasLayer"
@onready var card4 = $"."

func ready():
	$CanvasLayer4.hide()
	pass

func interact():
	Global.life_gain = true
	print ("You gain a life instead of the enemy losing one")
	hide_card()
	pass

func show_card():
	crosshair.hide()
	camera.game_start = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$CanvasLayer4.show()

func hide_card():
	crosshair.show()
	camera.game_start = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer4.hide()
	card4.hide()
