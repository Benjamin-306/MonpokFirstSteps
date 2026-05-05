extends CanvasLayer

var IMAGE = false
var TEXT = false
var catch = false
var body = false
@onready var inventory = get_tree().root.find_child("Inventory", true, false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func add():
	if TEXT is String:
		$ColorRect/Label3.text = TEXT
		$ColorRect/Monpok.texture = load(IMAGE)
		if catch == true:
			hide()
			if body.name == "Player":
				if body.balls > 0:
					body.balls -= 1
					inventory.add(TEXT, IMAGE)
					catch = false
		


func _on_label_pressed() -> void:
	catch = true
	add()



func _on_label_2_pressed() -> void:
	hide()
