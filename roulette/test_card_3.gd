extends RigidBody3D

@export var camera : Camera3D
@onready var game_start = true
@onready var crosshair = $"../CanvasLayer"
@onready var card3 = $"."
var click = false

func ready():
	$CanvasLayer3.hide()
	pass

func interact():
	print ("Don't lose a life")
	Global.second_chance = true
	click = true
	hide_card()
	pass


func show_card():
	if Global.card == true:
		crosshair.hide()
		camera.game_start = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$CanvasLayer3.show()

func hide_card():
	crosshair.show()
	camera.game_start = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer3.hide()
	if click == true:
		card3.hide()
