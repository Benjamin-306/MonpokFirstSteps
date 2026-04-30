extends AnimatableBody2D

const IMAGE = "res://Assets/Sprites/Monpok_01.png"
const TEXT = "Monpok1"

@onready var inventory = get_tree().root.find_child("Inventory", true, false)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if body.balls > 0:
			body.balls -= 1
			inventory.add(TEXT, IMAGE)
			if inventory.full == false:
				queue_free()
		else:
			pass
