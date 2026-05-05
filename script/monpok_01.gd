extends AnimatableBody2D

const IMAGE = "res://Assets/Sprites/Monpok_01.png"
const TEXT = "Monpok1"

@onready var inventory = get_tree().root.find_child("Inventory", true, false)
@onready var OnMonpokCaptured = get_tree().root.find_child("OnMonpokCaptured", true, false)
var catch = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	OnMonpokCaptured.show()
	OnMonpokCaptured.IMAGE = IMAGE
	OnMonpokCaptured.TEXT = TEXT
	OnMonpokCaptured.body = body
	OnMonpokCaptured.add()
	if inventory.full == false:
		queue_free()
	else:
		pass
