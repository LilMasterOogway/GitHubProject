extends Node


signal life_lost
signal life_lost_enemy
signal died

var lives = 3
var enemy_lives = 3

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
		#game_over()
		pass
	
	
func game_over():
	emit_signal("died")
	pass
