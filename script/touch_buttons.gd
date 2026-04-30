extends Node


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var platform = OS.get_name()
	
	if platform == "Android" or platform == "iOS":
		$CanvasLayer/VirtualJoystick.show()
		
	if OS.has_feature("web_android") or OS.has_feature("web_ios"):
		$CanvasLayer/VirtualJoystick.show()
	
	else:
		$CanvasLayer/VirtualJoystick.hide()
