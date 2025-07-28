extends Node3D
@export var camera :Camera3D
@export var crosshair : Sprite2D
var camera_animation 
@onready var wheel_animation = $AnimationPlayer
@export var laughing : AnimationPlayer

# New exports for weighted animation selection
 # Chance (0.0 to 1.0) to pick the preferred animation

func _ready():
	camera_animation = camera.get_node("AnimationPlayer")
	
func roll(bet:int):
	camera.game_start = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	crosshair.hide()
	camera_animation.play("Camera movement")
	await get_tree().create_timer(1.5).timeout
	
	var wheel_animations = ["land_on_red", "land_on_white"]
	var random_animation : String
	
	# Weighted selection logic
	var random_value = randf()  # Returns a float between 0.0 and 1.0
	
	if random_value < Global.preferred_chance and Global.preferred_animation in wheel_animations:
		# Pick the preferred animation
		random_animation = Global.preferred_animation
	else:
		# Pick from remaining animations (excluding preferred if it was an option)
		var remaining_animations = wheel_animations.duplicate()
		if Global.preferred_animation in remaining_animations:
			remaining_animations.erase(Global.preferred_animation)
		
		# If we still have animations to choose from, pick randomly
		if remaining_animations.size() > 0:
			random_animation = remaining_animations[randi() % remaining_animations.size()]
		else:
			# Fallback to original random selection if something goes wrong
			random_animation = wheel_animations[randi() % wheel_animations.size()]
	
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
		if Global.lives>0:
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
		if Global.lives>0:
			laughing.play("mixamo_com")
			await get_tree().create_timer(1.0).timeout
			camera_animation.play("laughing_animation")
			await get_tree().create_timer(3.0).timeout
			camera_animation.play("laughing_animation_2")
			crosshair.show()
			camera.game_start = true
		pass
	pass
	Global.reset_chance()
