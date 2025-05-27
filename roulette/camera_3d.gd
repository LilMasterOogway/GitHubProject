extends Node3D

@onready var raycast = $RayCast3D
# Mouse sensitivity
@export var mouse_sensitivity: float = 0.0025
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
	if event.is_action_pressed("Interact"): # Define this in Input Map
		if raycast.is_colliding() and game_start:
			var collider = raycast.get_collider()
			var collision_point = raycast.get_collision_point()
			 # Check if the object has an interact method
			if collider.has_method("interact"):
				collider.interact()
	elif event is InputEventMouseMotion and game_start:
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
