extends KinematicBody2D

const GRAVITY = 50
const JUMP = 750
const FLOOR = Vector2(0, -1)
export var speed = 250
var velocity = Vector2.ZERO;

# warning-ignore:unused_argument
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		input_vector.x += 1
	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y -= JUMP

	
	velocity.x = input_vector.x * speed
	velocity.y += GRAVITY

	if velocity.x != 0 and velocity.y != 0:
		$AnimatedSprite.play("Run")
	elif velocity.x == 0 and velocity.y != 0:
		$AnimatedSprite.play("Idle")
	
	#if velocity.y != 0:
		#$AnimatedSprite.play("Jump")
		
	if velocity.x > 0:
		$AnimatedSprite.flip_h = 0
		$CollisionShape2D.scale.x = 1 
	elif velocity.x < 0:
		$AnimatedSprite.flip_h = 1
		$CollisionShape2D.scale.x = -1 
		
	velocity = move_and_slide(velocity, FLOOR)

	
