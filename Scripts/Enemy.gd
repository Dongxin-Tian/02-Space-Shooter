extends Area2D

var plEnemyBullet := preload("res://Scenes/EnemyBullet.tscn")
var pattern: int = 1 # 1 - Aim | 2 - Square | 3 - Cross

var life: int = 50
var target: Vector2 = Vector2(0, 0)

const SMOOTH_SPEED = 2
var position_difference = Vector2()
var smoothed_velocity = Vector2()

var im_enemy = true

func _ready():
	pattern = int(rand_range(1, 4))
	fire()

func _process(delta):
	var destination = target

	position_difference = destination - position
	smoothed_velocity = position_difference * SMOOTH_SPEED * delta

	position += smoothed_velocity

func damage(amount: int):
	life -= amount
	if life <= 0:
		get_tree().current_scene.get_node("/root/GamePlay/Player").score += 1000
		get_tree().current_scene.get_node("/root/GamePlay").enemyNumber -= 1
		queue_free()

func _on_Enemy_body_entered(body):
	if body.get_name() == "Player":
		body.die()
		queue_free()
		
func fire():
	var t = Timer.new()
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")

	if pattern == 1:
		var bl = plEnemyBullet.instance()
		get_tree().current_scene.add_child_below_node(get_node("/root/GamePlay/Player"), bl)
		bl.global_position = global_position
		var dir = (get_node("/root/GamePlay/Player").global_position - global_position).normalized()
		bl.global_rotation = dir.angle() + PI / 2.0
		bl.direction = dir
	elif pattern == 2:
		for i in range(8):
			var bl = plEnemyBullet.instance()
			get_tree().current_scene.add_child_below_node(get_node("/root/GamePlay/Player"), bl)
			bl.global_position = global_position
			var dir = Vector2(0, 0)
			if i == 0:
				dir = Vector2(1, 0)
			elif i == 1:
				dir = Vector2(1, -1)
			elif i == 2:
				dir = Vector2(0, -1)
			elif i == 3:
				dir = Vector2(-1, -1)
			elif i == 4:
				dir = Vector2(-1, 0)
			elif i == 5:
				dir = Vector2(-1, 1)
			elif i == 6:
				dir = Vector2(0, 1)
			elif i == 7:
				dir = Vector2(1, 1)
			bl.global_rotation = dir.angle() + PI / 2.0
			bl.direction = dir
	elif pattern == 3:
		for i in range(4):
			var bl = plEnemyBullet.instance()
			get_tree().current_scene.add_child_below_node(get_node("/root/GamePlay/Player"), bl)
			bl.global_position = global_position
			var dir = Vector2(0, 0)
			if i == 0:
				dir = Vector2(1, 0)
			elif i == 1:
				dir = Vector2(-1, 0)
			elif i == 2:
				dir = Vector2(0, 1)
			elif i == 3:
				dir = Vector2(0, -1)
			bl.global_rotation = dir.angle() + PI / 2.0
			bl.direction = dir
	fire()
	t.queue_free()
