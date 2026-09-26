extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -350.0

# Used to smooth the movement slightly
var target_vel = Vector2(0, 0)
# How fast the player can accelerate, not actually pixels per second squared
var player_acceleration = 5
# Scales the speed at which you move vertically
var vertical_scale = 7

# If the player is moving at less than this speed, they are stopped
var stopping_speed = 0.1

func _physics_process(delta: float) -> void:
	move(delta)
	move_and_slide()
	_update_animation()


func _update_animation() -> void:
	var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
	animated_sprite.flip_h = velocity.x < 0
	var animation_type: String = get_animation_type()

	if animated_sprite.animation != animation_type:
		animated_sprite.play(animation_type)

func get_animation_type() -> String:
	if not is_on_floor():
		if velocity.y > stopping_speed:
			return "fall"
		return "jump"

	if abs(velocity.x) > stopping_speed:
		return "run"

	return "move"


func move(delta):
	target_vel = Vector2.ZERO

	if is_on_floor():
		if Input.is_action_pressed("move_up"):
			velocity.y = JUMP_VELOCITY * vertical_scale
	else:
		velocity += get_gravity() * delta * vertical_scale

	if Input.is_action_pressed("move_left"):
		target_vel[0] += -SPEED
	if Input.is_action_pressed("move_right"):
		target_vel[0] += SPEED

	velocity += (target_vel - velocity) / player_acceleration
