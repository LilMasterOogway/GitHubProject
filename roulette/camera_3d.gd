extends Node3D


# Mouse sensitivity
@export var mouse_sensitivity: float = 0.005
var game_start = false
# Angle limits (in degrees)
@export var max_pitch: float = 80.0  # Up/down limit
@export var min_pitch: float = -80.0
@export var max_yaw: float = 90.0    # Left/right limit
@export var min_yaw: float = -90.0

# Current rotation
var pitch: float = 0.0
var yaw: float = 0.0

func _ready():
	pass



# This function will be called when the slider changes

	
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
