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
	
	# ALlow the player to move around
	move(delta)
	
	# Poitn the player in the correcct direction
	$AnimatedSprite2D.flip_h = velocity.x < 0
	
	var animation_type = get_animation_type()
	
	if animation_type == "move" or animation_type == "jump" or animation_type == "fall":
		$AnimatedSprite2D.play(animation_type)
	
	move_and_slide()

func get_animation_type():
	#print("velocity is ", velocity)
	
	# Check if the player is stopped
	if abs(velocity.length()) < stopping_speed:
		return "idle"
	
	# Check if the player is falling
	if velocity.y > stopping_speed:
		return "fall"
	
	# Check if the player is jumping up
	if velocity.y < -stopping_speed:
		return "jump"
	
	# Check if the player is moving to the left or right
	if abs(velocity.x) > stopping_speed:
		return "move"

func move(delta):
	target_vel = Vector2.ZERO
	
	# Add vertical movement
	if is_on_floor():
		if Input.is_action_pressed("move_up"):
			velocity.y = JUMP_VELOCITY * vertical_scale
	else:
		# Add gravity
		velocity += get_gravity() * delta * vertical_scale
	
	if Input.is_action_pressed("move_left"):
		target_vel[0] += -SPEED
	if Input.is_action_pressed("move_right"):
		target_vel[0] += SPEED
	
	velocity += (target_vel - velocity) / player_acceleration
