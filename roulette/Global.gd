extends Node

var lives = 3

func lose_life():
	lives -= 1
	print ("loss")
	print (lives)
	if lives <= 0:
		game_over()
	
func game_over():
	get_tree().quit()
	pass
