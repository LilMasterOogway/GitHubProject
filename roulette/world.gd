extends Node3D

# References to your nodes
@onready var player_camera = $Camera3D  # Your camera node
@onready var main_menu = $MainMenu  # Your menu node

var is_menu_active = false

func _ready():
	# Start with game active, menu inactive
	set_game_active(true)

func _input(event):
	if event.is_action_pressed("Escape"):  # Escape key
		toggle_active_control()

func toggle_active_control():
	is_menu_active = !is_menu_active
	
	# Switch which nodes are processing input
	set_game_active(!is_menu_active)
	set_menu_active(is_menu_active)
	
	# Handle mouse cursor visibility
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE if is_menu_active else Input.MOUSE_MODE_CAPTURED)

func set_game_active(active):
	# Enable/disable game controls
	player_camera.set_process_input(active)
	player_camera.set_process(active)
	
	# You can do the same for other gameplay nodes
	get_tree().call_group("gameplay_nodes", "set_process", active)
	get_tree().call_group("gameplay_nodes", "set_process_input", active)

func set_menu_active(active):
	# Enable/disable menu
	main_menu.visible = active
	main_menu.set_process_input(active)
	
	# Optional: Pause game when menu is active
	get_tree().paused = active
