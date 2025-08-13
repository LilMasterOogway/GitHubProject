extends RigidBody3D

class_name Card

var camera : Camera3D

func _ready():
	$CanvasLayer.hide()
	camera = get_tree().get_first_node_in_group("Camera")
