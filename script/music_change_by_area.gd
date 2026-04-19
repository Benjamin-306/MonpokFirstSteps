extends Area2D

@onready var audio_stream_player = get_tree().root.find_child("AudioStreamPlayer2D", true, false)
@onready var stream = preload("res://Assets/sounds/EndlessTallGrass.mp3")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		audio_stream_player.stream = stream
		audio_stream_player.play()
