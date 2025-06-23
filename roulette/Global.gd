extends Node


signal life_lost
signal life_lost_enemy
signal died
signal won

var lives = 3
var enemy_lives = 3
func reset():
	enemy_lives = 3
	lives = 3
	
func lose_life():
	lives -= 1
	emit_signal("life_lost")
	print ("loss")
	print (lives)
	if lives <= 0:
		game_over()
	
func lose_life_enemy():
	enemy_lives -= 1
	emit_signal("life_lost_enemy")
	if enemy_lives <= 0:
		won_game()
		pass
	
func won_game():
	emit_signal("won")
	pass
	
	
func game_over():
	emit_signal("died")
	pass
