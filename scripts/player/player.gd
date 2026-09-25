extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -300.0

# Used to smooth the movement slightly
var target_vel = Vector2(0, 0)
# How fast the player can accelerate, not actually pixels per second squared
var player_acceleration = 5
# Max speed at which the player can fall
var terminal_velocity = 700
# Scales the speed at which you move vertically
var vertical_scale = 12

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	
	# ALlow the player to move around
	move(delta)
	
	
	move_and_slide()


func move(delta):
	target_vel = Vector2.ZERO
	
	# Add vertical movement
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
