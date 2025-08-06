extends RigidBody3D
var chance = 0.8
var animation = "land_on_red"

@export var camera : Camera3D
@onready var game_start = true
@onready var crosshair = $"../CanvasLayer"
@onready var card2 = $"."
var click = false

func ready():
	$CanvasLayer2.hide()

	
func interact():
	print ("Stack the Odds on Red")
	Global.preferred_chance = chance
	Global.preferred_animation = animation
	click = true
	hide_card()





func show_card():
	if Global.card == true:
		crosshair.hide()
		camera.game_start = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$CanvasLayer2.show()
	
func hide_card():
	crosshair.show()
	camera.game_start = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer2.hide()
	if click == true:
		card2.hide()
