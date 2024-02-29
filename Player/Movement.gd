extends KinematicBody2D

const GRAVITY = 40
const JUMP = 700
const FLOOR = Vector2(0, -1)
export var speed = 200
var velocity = Vector2.ZERO;

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		input_vector.x += 1
	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y -= JUMP

	velocity = move_and_slide(velocity, Vector2(0, -1))
	velocity.x = input_vector.x * speed

	velocity.y += GRAVITY

	if velocity.x == 0:
		$AnimatedSprite.play("Idle")
	else:
		$AnimatedSprite.play("Run")
		
	if velocity.x >= 0:
		$AnimatedSprite.flip_h = 0
	else:
		$AnimatedSprite.flip_h = 1

	

