extends Node


signal life_lost
signal life_lost_enemy
signal died
signal won
signal card_5
signal spin_end
signal volume_changed
var volume : float = 1 : 
	set(value) : 
		volume = value
		volume_change(value)
var preferred_animation : String = "land_on_red"  # The animation to favor
var preferred_chance : float = 0.5 
var second_chance = false 
var life_gain = false
var player_damage = 1
var enemy_damage = 1
var default_damage = 1
var lives = 3
var enemy_lives = 3
var card = false

func reset():
	enemy_lives = 3
	lives = 3

func volume_change(value):
	print("change value set get")
	volume_changed.emit()
	
func lose_life():
	lives -= enemy_damage
	emit_signal("life_lost")
	print ("loss")
	print (lives)
	reset_damage()
	if lives <= 0:
		game_over()
	
func lose_life_enemy():
	print("Player damage:",player_damage )
	enemy_lives -= player_damage
	print("Enemy Lives: ",enemy_lives)
	emit_signal("life_lost_enemy")
	reset_damage()
	if enemy_lives <= 0:
		won_game()
		pass
		
func life_plus():
	if lives < 5:
		lives += 1
		print(lives)
		emit_signal("card_5")
		
	pass
	
func reset_damage():
	player_damage = default_damage
	enemy_damage = default_damage
	
func won_game():
	emit_signal("won")
	pass
	
	
func game_over():
	emit_signal("died")
	pass

func reset_chance():
	preferred_chance = 0.5
	

	

	
