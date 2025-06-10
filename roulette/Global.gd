extends Node


signal life_lost

var lives = 3

func lose_life():
	lives -= 1
	emit_signal("life_lost")
	print ("loss")
	print (lives)
	if lives <= 0:
		game_over()
	
	
func game_over():
	get_tree().quit()
	pass
