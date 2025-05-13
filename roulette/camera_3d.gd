extends Node3D

# Mouse sensitivity
@export var mouse_sensitivity: float = 0.005
@onready var v_box_container: VBoxContainer = $"../VBoxContainer"
@onready var v_box_container_2: VBoxContainer = $"../VBoxContainer2"
@onready var v_box_container_3: VBoxContainer = $"../VBoxContainer3"

# Angle limits (in degrees)
@export var max_pitch: float = 80.0  # Up/down limit
@export var min_pitch: float = -80.0
@export var max_yaw: float = 90.0    # Left/right limit
@export var min_yaw: float = -90.0
var game_start = false
# Current rotation
var pitch: float = 0.0
var yaw: float = 0.0
@onready var volume_slider = $"../VBoxContainer3/HSlider"

func _ready():
	v_box_container_3.hide()
	# Set initial value (0 to 1 range for volume)
	volume_slider.min_value = 0.0
	volume_slider.max_value = 1.0
	volume_slider.value = 0.8  # Default volume at 80%
	
	# Connect the value_changed signal
	volume_slider.connect("value_changed", _on_volume_changed)
	
	# Set initial volume (correct way)
	_on_volume_changed(volume_slider.value)

# This function will be called when the slider changes
func _on_volume_changed(value):
	# Convert to decibels and set the bus volume
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db)
	
func _input(event):
	if event is InputEventMouseMotion and game_start:
		# Get mouse movement
		var mouse_delta = event.relative
		
		# Update yaw (horizontal)
		yaw -= mouse_delta.x * mouse_sensitivity
		# Clamp yaw
		yaw = clamp(yaw, deg_to_rad(min_yaw), deg_to_rad(max_yaw))
		
		# Update pitch (vertical)
		pitch -= mouse_delta.y * mouse_sensitivity
		# Clamp pitch
		pitch = clamp(pitch, deg_to_rad(min_pitch), deg_to_rad(max_pitch))
		
		# Apply rotation
		rotation = Vector3(pitch, yaw, 0)

func _process(delta):
	# Allow releasing mouse with ESC
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_button_pressed() -> void:
	v_box_container.hide()
	v_box_container_2.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	game_start = true
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	v_box_container_2.hide()
	v_box_container_3.show()
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	pass # Replace with function body.



func _on_h_slider_drag_ended(value_changed: bool) -> void:
	pass # Replace with function body.
