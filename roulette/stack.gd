extends RigidBody3D
@export var scene_root : Node3D
#@export var cards : Array[RigidBody3D]= []
@onready var spawn1 = $Marker3D
@onready var spawn2 = $Marker3D2
var cards_showing = 0
@export var Deck : Array[PackedScene]

func _ready():
	Deck.shuffle()
	Global.spin_end.connect(reset_counter)

func deal():
	print("Stack Work")
	Global.card = true
	while cards_showing < 2:
		var card_scene = Deck.pop_back()
		var card = card_scene.instantiate()
		scene_root.add_child(card)
		if cards_showing == 0:
			card.global_transform = spawn1.global_transform
		else:
			card.global_transform = spawn2.global_transform
		cards_showing += 1

func reset_counter():
	cards_showing = get_tree().get_node_count_in_group("Card")
