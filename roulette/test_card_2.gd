extends RigidBody3D
var chance = 0.8
var animation = "land_on_red"

func ready():
	$CanvasLayer.hide()

	
func interact():
	print ("Stack the Odds on Red")
	Global.preferred_chance = chance
	Global.preferred_animation = animation
	_on_cancel_pressed()



func _on_use_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$CanvasLayer.show()
	pass # Replace with function body.


func _on_cancel_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer.hide()
	pass # Replace with function body.
