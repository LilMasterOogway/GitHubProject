extends RigidBody3D
@onready var camera = $"../Camera3D"
@onready var crosshair = $"../CanvasLayer/MarginContainer/Sprite2D"
@onready var animation = $"../Camera3D/AnimationPlayer"

func roll():
	camera.game_start = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	crosshair.hide()
	animation.play("Camera movement")
	print ("apple")
	pass
