extends Card


@onready var game_start = true
@onready var crosshair = $"../CanvasLayer"
@onready var card4 = $"."
var click = false



func interact():
	Global.life_gain = true
	print ("You gain a life instead of the enemy losing one")
	click = true
	hide_card()
	queue_free()
	pass

func show_card():
	if Global.card == true:
		crosshair.hide()
		camera.game_start = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$CanvasLayer.show()

func hide_card():
	crosshair.show()
	camera.game_start = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer.hide()
	if click == true:
		card4.hide()
