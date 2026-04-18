extends Control

var inventory = [null, null, null, null, null, null]
var full = false
	
func add(TEXT, IMAGE):
	full = false
	var free_place = inventory.find(null)
	if free_place != -1:
		free_place += 1
		var direction_rect = get_node("Monpok" + str(free_place) + "/TextureRect")
		var direction_label = get_node("Monpok" + str(free_place) + "/Label")
		direction_rect.texture = load(IMAGE)
		direction_label.text = TEXT
		inventory[free_place - 1] = TEXT
	else:
		full = true
		$Timer.start()
		show()
		$Label.show()


func _on_timer_timeout() -> void:
	hide()
	$Label.hide()
