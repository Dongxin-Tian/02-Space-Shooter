extends Area2D

var life: int = 50
var target: Vector2 = Vector2(0, 0)

const SMOOTH_SPEED = 2
var position_difference = Vector2()
var smoothed_velocity = Vector2()

var im_enemy = true

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
