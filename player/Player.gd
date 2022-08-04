extends KinematicBody2D
# comment
export (int) var speed = 200

export var ACCELERATION = 500
export var MAX_SPEED = 80
export var ROLL_SPEED  = 120
export var FRICTION = 500


var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	if velocity.x > 0:
		$PlayerSprite.animation = "Right2"
	elif velocity.x < 0:
		$PlayerSprite.animation = "Left2"
	elif velocity.y > 0:
		$PlayerSprite.animation = "Down2"
	elif velocity.y < 0:
		$PlayerSprite.animation = "Up2"
	else:
		$PlayerSprite.animation = "GIRANDO"
