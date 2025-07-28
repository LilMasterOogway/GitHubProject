extends RigidBody3D
var chance = 0.8
var animation = "land_on_red"
func interact():
	print ("Stack the Odds on Red")
	Global.preferred_chance = chance
	Global.preferred_animation = animation
	
