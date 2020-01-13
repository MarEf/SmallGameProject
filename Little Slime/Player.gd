extends KinematicBody2D

onready var global = get_node("/root/global")
# Declare member variables here. Examples:
const GRAVITY = 250

var sizes = [0.15, 0.3, 0.5, 0.75, 1]
var speeds = [300, 250, 200, 160, 120]
var jump_heights = [250, 200, 150, 120, 100]
var size = 3
var speed = speeds[size]
var jump_height = 150
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
		velocity.x = speeds[size]
	if move_left:
		velocity.x = -speeds[size]
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

func check_damage():
	if (global.lives>-1)and(global.lives<5):
		if global.lives>size:
			heal()
		if global.lives<size:
			damage()
	
func _physics_process(delta):
	velocity.x = 0
	var motion = velocity * delta
	get_input()
	check_collisions(motion, delta)
	check_damage()
	#TO BE EDITED
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
func jump():
	if jumping == false:
		velocity.y = -jump_height

func damage():
	velocity.bounce(-velocity)
	if size>0:
		size -=1
		self.scale = Vector2(sizes[size],sizes[size])
		speed = speeds[size]
		jump_height = jump_heights[size]
	else:
		pass
	
func heal():
	if size<5:
		size +=1
		self.scale = Vector2(sizes[size],sizes[size])
		speed = speeds[size]
		jump_height = jump_heights[size]
	else:
		pass