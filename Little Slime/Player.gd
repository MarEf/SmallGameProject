extends KinematicBody2D

# Declare member variables here. Examples:
const GRAVITY = 200

var size = 1
var speed = 200/size
var jump_height = 150/size
var screen_size
var jumping = false

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.

func get_input():
	var move_right = Input.is_action_pressed("move_right")
	var move_left = Input.is_action_pressed("move_left")
	var move_down = Input.is_action_pressed("move_down")
	var jump = Input.is_action_pressed("jump")
	
	if move_right:
		velocity.x = speed
	if move_left:
		velocity.x = -speed
	if move_down:
		velocity.y = GRAVITY
	if jump:
		jump()

func check_collisions(motion, delta):
	var collision = move_and_collide(motion)
	if !collision:
		velocity.y += delta * GRAVITY
		jumping = true
	else:
		jumping = false

func _physics_process(delta):
	velocity.x = 0
	var motion = velocity * delta
	get_input()
	check_collisions(motion, delta)
	
	#TO BE EDITED
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
func jump():
	if jumping == false:
		velocity.y = -jump_height
	