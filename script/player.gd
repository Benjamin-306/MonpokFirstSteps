extends CharacterBody2D


const SPEED = 130.0
const FRICTION = 5000
const ACCELARATION = 600

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var tap: AudioStreamPlayer2D = $tap
@onready var tap_timer: Timer = $tap_timer
func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
		
	if direction.length() == 0:
		animated_sprite.play("idle")
		tap_timer.stop()
	else:
		animated_sprite.play("run")
		if tap_timer.is_stopped():
			tap_timer.start()
	
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELARATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move_and_slide()


func _on_tap_timer_timeout() -> void:
	tap.play()
