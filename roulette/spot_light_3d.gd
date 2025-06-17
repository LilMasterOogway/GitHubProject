extends SpotLight3D

@onready var flicker_timer = Timer.new()
var original_light_energy: float
var is_flickering = false
var flicker_intensity = 1.0

func _ready():
	original_light_energy = light_energy
	add_child(flicker_timer)
	flicker_timer.timeout.connect(_on_flicker_timer_timeout)
	start_flickering()

func start_flickering():
	is_flickering = true
	_schedule_next_flicker()

func _schedule_next_flicker():
	if not is_flickering:
		return
	
	# Horror timing: long pauses followed by rapid bursts
	var rand = randf()
	var flicker_interval
	
	if rand < 0.3:  # 30% chance of rapid flickers
		flicker_interval = randf_range(0.05, 0.15)
	elif rand < 0.6:  # 30% chance of short pause
		flicker_interval = randf_range(0.3, 0.8)
	else:  # 40% chance of long eerie pause
		flicker_interval = randf_range(2.0, 8.0)
	
	flicker_timer.start(flicker_interval)

func _on_flicker_timer_timeout():
	var flicker_type = randf()
	
	if flicker_type < 0.4:  # Quick on/off flicker
		light_energy = 0.0
		await get_tree().create_timer(randf_range(0.03, 0.1)).timeout
		light_energy = original_light_energy * randf_range(0.8, 1.2)
		
	elif flicker_type < 0.7:  # Stuttering flicker
		for i in range(randi_range(2, 5)):
			light_energy = 0.0
			await get_tree().create_timer(randf_range(0.02, 0.05)).timeout
			light_energy = original_light_energy * randf_range(0.3, 1.0)
			await get_tree().create_timer(randf_range(0.02, 0.08)).timeout
			
	
	_schedule_next_flicker()
