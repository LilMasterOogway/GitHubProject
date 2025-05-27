extends Control

@export var camera : Camera3D
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var v_box_container_2: VBoxContainer = $VBoxContainer2
@onready var v_box_container_3: MarginContainer = $MarginContainer
@onready var canvaslayer: CanvasLayer = $"../CanvasLayer"
#@onready var game_start = false

func _ready():
	v_box_container_3.hide()
	canvaslayer.hide()
	
func _process(delta):

	# Allow releasing mouse with ESC
	if Input.is_action_just_pressed("Escape"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			camera.game_start = false
			v_box_container.show()
			v_box_container_2.show()
			canvaslayer.hide() 
			pass
		else:
			#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			pass
	


func _on_button_pressed() -> void:
	canvaslayer.show()
	v_box_container.hide()
	v_box_container_2.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	camera.game_start = true
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	v_box_container_2.hide()
	v_box_container_3.show()
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_button_4_pressed() -> void:
	v_box_container_3.hide()
	v_box_container.show()
	v_box_container_2.show()
	pass # Replace with function body.
