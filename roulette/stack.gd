extends RigidBody3D

@export var cards : Array[RigidBody3D]= []
@onready var spawn1 = $Marker3D
@onready var spawn2 = $Marker3D2
var cards_showing = 0

func _ready():
	hide_all_cards()

func deal():
	print("Stack Work")
	Global.card = true
	while cards_showing < 2:
		var card =  cards.pick_random()
		if not card.visible :
			print("making visible")
			card.visible = true
			cards_showing+=1
		
		if cards_showing == 1:
			print("moving 1")
			card.position = spawn1.global_position
		elif cards_showing == 2:
			print("moving 2")
			card.position = spawn2.global_position
			
		
	pass


func hide_all_cards():
	for card in cards:
		card.visible = false
	cards_showing = 0
