extends Node

@export var cell_size = 20

@export var scene_1 = preload("res://Scenes/Monpok01.tscn")
@export var scene_2 = preload("res://Scenes/Monpok02.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("READY")
	var area_size = $ColorRect.size
	spawn_grid(area_size)
	
func spawn_grid(area_size):
	print("SpawnGrid")
	var columns = int(area_size.x / cell_size)
	var rows = int(area_size.y / cell_size)
	
	var start_pos = $ColorRect.global_position
	
	for x in range(columns):
		for y in range(rows):
			var roll = randf() * 100
			
			var spawn_pos = start_pos + Vector2(x * cell_size, y * cell_size)
			spawn_pos += Vector2(cell_size / 2.0, cell_size / 2.0)
			
			if roll < 95:
				continue
			elif roll < 98:
				spawn_object(scene_2, spawn_pos)
			else:
				spawn_object(scene_1, spawn_pos)
				
func spawn_object(scene:PackedScene, pos:Vector2):
	print("SpawnObject")
	if scene == null:
		return
	var instance = scene.instantiate()
	add_child(instance)
	if instance is AnimatableBody2D:
		instance.global_position = pos
