extends CanvasLayer

var IMAGE = false
var TEXT = false
var catch = false
var BODY = false
@onready var inventory = get_tree().root.find_child("Inventory", true, false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func add():
		if catch == true:
			hide()
			if BODY.name == "Player":
				if BODY.balls > 0:
					BODY.balls -= 1
					inventory.add(TEXT, IMAGE)
					clean()
		


	
func setup(image, text, body):
	show()
	IMAGE = image
	TEXT = text
	BODY = body
	$ColorRect/Label3.text = TEXT
	$ColorRect/Monpok.texture = load(IMAGE)
	if body.balls <= 0:
		$ColorRect/CatchButton.disabled = true
	
func clean():
	IMAGE = false
	TEXT = false
	BODY = false
	catch = false
	$ColorRect/Label3.text = "Monpok"
	$ColorRect/Monpok.texture = null


func _on_catch_button_pressed() -> void:
	catch = true
	add()


func _on_escape_button_pressed() -> void:
	hide()
