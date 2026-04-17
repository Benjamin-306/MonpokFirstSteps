extends AnimatableBody2D

const IMAGE = "res://Assets/Sprites/Monpok_01.png"
const TEXT = "Monpok1"

@onready var inventory: Control = %Inventory


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		inventory.add(TEXT, IMAGE)
		if inventory.full == false:
			queue_free()
