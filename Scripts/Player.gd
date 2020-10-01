extends KinematicBody2D

var plBullet := preload("res://Scenes/Bullet.tscn")

var lives = 3
var bombs = 3
var speed = 5
var score = 0
var power = 0.00
var alpha = 0

onready var dot = get_node("Dot")

func _physics_process(delta):
	# Movement
	if Input.is_action_pressed("slow"):
		speed = 2.5
		if alpha < 1:
			alpha += 0.1
	else:
		if alpha > 0:
			alpha -= 0.1
	dot.modulate = Color(1, 1, 1, alpha)
	if Input.is_action_just_released("slow"):
		speed = 5
	position += get_input()*speed
	position.x = clamp(position.x, 194, 603)
	position.y = clamp(position.y, 42, 558)
	
	# Power limitation
	if power > 4.00:
		power = 4.00
	if power < 0.00:
		power = 0.00
		
	# Shoot
	if Input.is_action_pressed("shoot"):
		if power >= 0.00 and power < 1.00:
			var bullet := plBullet.instance()
			bullet.position = position
			get_tree().current_scene.add_child_below_node(get_node("."), bullet)
		elif power >= 1.00 and power < 2.00:
			pass
		elif power >= 2.00 and power < 3.00:
			pass
		elif power >= 3.00 and power < 4.00:
			pass
		elif power >= 4.00:
			pass
			
func get_input():
	var input_dir = Vector2(0, 0)
	var dir = Vector2(0, 0)
	if Input.is_action_pressed("left"):
		input_dir.x = -1
	if Input.is_action_pressed("right"):
		input_dir.x = 1
	if Input.is_action_pressed("up"):
		input_dir.y = -1
	if Input.is_action_pressed("down"):
		input_dir.y = 1
	if input_dir.x != 0 and input_dir.y != 0:
		dir.x = input_dir.x / 1.43
		dir.y = input_dir.y / 1.43
	else:
		dir = input_dir
	return dir.rotated(rotation)
