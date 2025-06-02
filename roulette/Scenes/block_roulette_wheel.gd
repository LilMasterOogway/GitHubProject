extends Node3D
@onready var camera = $"../Camera3D"
@onready var crosshair = $"../CanvasLayer/MarginContainer/Sprite2D"
@onready var camera_animation = $"../Camera3D/AnimationPlayer"
@onready var wheel_animation = $AnimationPlayer

func roll():
	camera.game_start = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	crosshair.hide()
	camera_animation.play("Camera movement")
	await get_tree().create_timer(2.0).timeout
	var wheel_animation = ["land_on_red", "land_on_white"]
	var random_animation = wheel_animation[randi() % wheel_animation.size()]
	$AnimationPlayer.play(random_animation)
	pass
