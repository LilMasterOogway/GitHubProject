extends RigidBody3D

@export var camera : Camera3D
@onready var game_start = true
@onready var crosshair = $"../CanvasLayer"
@onready var card3 = $"."

func ready():
	$CanvasLayer3.hide()
	pass

func interact():
	print ("Don't lose a life")
	Global.second_chance = true
	hide_card()
	pass


func show_card():
	crosshair.hide()
	camera.game_start = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$CanvasLayer3.show()

func hide_card():
	crosshair.show()
	camera.game_start = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer3.hide()
	card3.hide()
