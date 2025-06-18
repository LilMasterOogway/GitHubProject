extends Node3D
@export var camera :Camera3D
@export var crosshair : Sprite2D
var camera_animation 
@onready var wheel_animation = $AnimationPlayer
@export var laughing : AnimationPlayer

func _ready():
	camera_animation = camera.get_node("AnimationPlayer")
	
func roll(bet:int):
	camera.game_start = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	crosshair.hide()
	camera_animation.play("Camera movement")
	await get_tree().create_timer(1.5).timeout
	var wheel_animation = ["land_on_red", "land_on_white"]
	var random_animation = wheel_animation[randi() % wheel_animation.size()]
	$AnimationPlayer.play(random_animation)
	if random_animation == "land_on_red" and bet == 2:
		await get_tree().create_timer(5.0).timeout
		camera_animation.play("Camera movement_2")
		camera.game_start = true
		crosshair.show()
		print ("won")
		Global.lose_life_enemy()
		pass
	elif random_animation == "land_on_red" and bet != 2:
		await get_tree().create_timer(5.0).timeout
		camera_animation.play("Camera movement_2")
		Global.lose_life()
		laughing.play("mixamo_com")
		await get_tree().create_timer(1.0).timeout
		camera_animation.play("laughing_animation")
		await get_tree().create_timer(3.0).timeout
		camera_animation.play("laughing_animation_2")
		crosshair.show()
		camera.game_start = true
		pass
	elif random_animation == "land_on_white" and bet == 1:
		await get_tree().create_timer(5.0).timeout
		camera_animation.play("Camera movement_2")
		camera.game_start = true
		crosshair.show()
		print ("won")
		Global.lose_life_enemy()
		
		pass
	elif random_animation == "land_on_white" and bet != 1:
		await get_tree().create_timer(5.0).timeout
		camera_animation.play("Camera movement_2")
		Global.lose_life()
		laughing.play("mixamo_com")
		await get_tree().create_timer(1.0).timeout
		camera_animation.play("laughing_animation")
		await get_tree().create_timer(3.0).timeout
		camera_animation.play("laughing_animation_2")
		crosshair.show()
		camera.game_start = true
		pass
	pass
