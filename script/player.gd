extends CharacterBody2D


var SPEED = 130.0
var JUMP_VELOCITY = -300.0
var invulnerable = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var tap: AudioStreamPlayer2D = $tap
@onready var timer: Timer = $Timer
@onready var jump: AudioStreamPlayer2D = $jump
func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if direction == 0:
		animated_sprite.play("idle")
		timer.stop()
	else:
		animated_sprite.play("run")
		if timer.is_stopped():
			timer.start()
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_timer_timeout() -> void:
	tap.play()
