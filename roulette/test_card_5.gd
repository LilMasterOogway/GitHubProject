extends RigidBody3D

@export var camera : Camera3D
@onready var game_start = true
@onready var crosshair = $"../CanvasLayer"
@onready var card5 = $"."
var click = false

func ready():
	$CanvasLayer5
	pass

func interact():
	Global.life_plus()
	print ("You gain a life")
	click = true
	hide_card()
	pass

func show_card():
	if Global.card == true:
		crosshair.hide()
		camera.game_start = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$CanvasLayer5.show()

func hide_card():
	crosshair.show()
	camera.game_start = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer5.hide()
	if click == true:
		card5.hide()
	
