extends Node


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("inventory"):
		if not $CanvasLayer/Inventory.visible:
			$CanvasLayer/Inventory.show()
		else:
			$CanvasLayer/Inventory.hide()
