extends Control

@export var camera : Camera3D
@onready var game_name: VBoxContainer = $VBoxContainer
@onready var start_menu: VBoxContainer = $VBoxContainer2
@onready var settings: MarginContainer = $MarginContainer
@onready var canvaslayer: CanvasLayer = $"../CanvasLayer"
@onready var game_start = false
@onready var crosshair = $"../CanvasLayer/MarginContainer/Sprite2D"
@onready var die_name: VBoxContainer = $VBoxContainer4
@onready var die_menu: VBoxContainer = $VBoxContainer5
@onready var win_name: VBoxContainer = $VBoxContainer6
@onready var win_menu: VBoxContainer = $VBoxContainer7
@onready var card_one: VBoxContainer = $VBoxContainer8
@onready var card_two: VBoxContainer = $VBoxContainer9
@onready var card_three: VBoxContainer = $VBoxContainer10
@onready var card_four: VBoxContainer = $VBoxContainer11
@onready var card_five: VBoxContainer = $VBoxContainer12
@onready var h_slider: HSlider = $MarginContainer/VBoxContainer3/HSlider

func _ready():
	card_one.hide()
	card_two.hide()
	card_three.hide()
	card_four.hide()
	card_five.hide()
	settings.hide()
	canvaslayer.hide()
	die_name.hide()
	die_menu.hide()
	win_name.hide()
	win_menu.hide()
	Global.died.connect(you_died)
	Global.won.connect(won_game)
	h_slider.value_changed.connect(change_volume)

func change_volume(value):
	Global.volume = h_slider.value
	print("changed volume in main menu")
		
func _process(delta):

	# Allow releasing mouse with ESC
	if Input.is_action_just_pressed("Escape"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			camera.game_start = false
			game_name.show()
			start_menu.show()
			canvaslayer.hide() 
			crosshair.show()
			pass
		else:
			#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			pass
	
func you_died():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	camera.game_start = false
	canvaslayer.hide()
	die_name.show()
	die_menu.show()
	pass
	
func won_game():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	camera.game_start = false
	canvaslayer.hide()
	win_name.show()
	win_menu.show()
	pass


#START GAME 
func _on_button_pressed() -> void:
	canvaslayer.show()
	game_name.hide()
	start_menu.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	camera.game_start = true
	pass # Replace with function body.

#SHOW SETTINGS ON MAIN MENU
func _on_button_2_pressed() -> void:
	start_menu.hide()
	settings.show()
	pass # Replace with function body.

#QUIT BUTTON
func _on_button_3_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.

#START GAME FROM SETTINGS
func _on_button_4_pressed() -> void:
	settings.hide()
	game_name.show()
	start_menu.show()
	Global.reset()
	pass # Replace with function body.

#START GAME ON DEATH SCREEN
func _on_button_5_pressed() -> void:
	canvaslayer.show()
	game_name.hide()
	start_menu.hide()
	Global.reset()
	get_tree().reload_current_scene()
	pass # Replace with function body.

#SETTINGS ON DEATH SCREEN
func _on_button_6_pressed() -> void:
	die_menu.hide()
	settings.show()
	die_name.hide()
	game_name.show()
	pass # Replace with function body.

#QUIT ON DEATH SCREEN
func _on_button_7_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.

#START ON WIN SCREEN
func _on_button_8_pressed() -> void:
	canvaslayer.show()
	game_name.hide()
	start_menu.hide()
	Global.reset()
	get_tree().reload_current_scene()
	pass # Replace with function body.

#SETTINGS ON WIN SCREEN
func _on_button_9_pressed() -> void:
	win_name.hide()
	settings.show()
	win_menu.hide()
	game_name.show()
	pass # Replace with function body.

#QUIT ON WIN SCREEN
func _on_button_10_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
