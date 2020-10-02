extends KinematicBody2D

var plBullet := preload("res://Scenes/Bullet.tscn")
var plBomb := preload("res://Scenes/Bomb.tscn")

var lives = 3
var bombs = 3
var speed = 5
var score = 0
var power = 4.00
var alpha = 0

var canShoot = true
var canDie = true

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
	if Input.is_action_pressed("shoot") and canShoot:
		if power >= 0.00 and power < 1.00:
			var bullet := plBullet.instance()
			bullet.position = position
			get_tree().current_scene.add_child_below_node(get_node("."), bullet)
		elif power >= 1.00 and power < 2.00:
			var bullet := plBullet.instance()
			var pos = position
			pos.x += 20
			bullet.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet)
			var bullet2 := plBullet.instance()
			pos.x -= 40
			bullet2.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet2)
		elif power >= 2.00 and power < 3.00:
			var bullet := plBullet.instance()
			var pos = position
			pos.x += 20
			bullet.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet)
			var bullet2 := plBullet.instance()
			pos.x -= 40
			bullet2.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet2)
			var bullet3 := plBullet.instance()
			var poz = position
			poz.y -= 5
			bullet3.position = poz
			get_tree().current_scene.add_child_below_node(get_node("."), bullet3)
		elif power >= 3.00 and power < 4.00:
			var bullet := plBullet.instance()
			var pos = position
			pos.x += 20
			bullet.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet)
			var bullet2 := plBullet.instance()
			pos.x -= 40
			bullet2.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet2)
			var bullet3 := plBullet.instance()
			pos.x += 30
			pos.y -= 5
			bullet3.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet3)
			var bullet4 := plBullet.instance()
			pos.x -= 20
			bullet4.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet4)
		elif power >= 4.00:
			var bullet := plBullet.instance()
			var pos = position
			pos.x += 20
			bullet.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet)
			var bullet2 := plBullet.instance()
			pos.x -= 40
			bullet2.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet2)
			var bullet3 := plBullet.instance()
			pos.x += 30
			pos.y -= 5
			bullet3.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet3)
			var bullet4 := plBullet.instance()
			pos.x -= 20
			bullet4.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet4)
			var bullet5 := plBullet.instance()
			pos.x += 10
			pos.y -= 5
			bullet5.position = pos
			get_tree().current_scene.add_child_below_node(get_node("."), bullet5)
		
		canShoot = false
		var t = Timer.new()
		t.set_wait_time(0.25)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		canShoot = true
		t.queue_free()
	
	#Bomb
	if Input.is_action_just_pressed("bomb"):
		if bombs > 0:
			bombs -= 1
			var bomb := plBomb.instance()
			bomb.position = position
			get_tree().current_scene.add_child_below_node(get_node("."), bomb)
	
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
	
func die():
	if canDie:
		lives -= 1
		if lives <= 0:
			get_tree().change_scene("res://Scenes/GameOver.tscn")
		position = Vector2(390, 530)
		canDie = false
		var spr = get_node("Sprite")
		spr.modulate = Color(1, 1, 1, 0.5)
		var t = Timer.new()
		t.set_wait_time(1)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		canDie = true
		spr.modulate = Color(1, 1, 1, 1)
		t.queue_free()
