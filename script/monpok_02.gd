extends AnimatableBody2D

const IMAGE = "res://Assets/Sprites/Monpok_02.png"
const TEXT = "Monpok2"

@onready var inventory = get_tree().root.find_child("Inventory", true, false)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		inventory.add(TEXT, IMAGE)
		if inventory.full == false:
			queue_free()
