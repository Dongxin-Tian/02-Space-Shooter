extends Area2D

var life: int = 50
var target: Vector2 = Vector2(0, 0)

const SMOOTH_SPEED = 2
var position_difference = Vector2()
var smoothed_velocity = Vector2()

func _process(delta):
	var destination = get_global_mouse_position()

	position_difference = destination - position
	smoothed_velocity = position_difference * SMOOTH_SPEED * delta

	position += smoothed_velocity

func damage(amount: int):
	life -= amount
	if life <= 0:
		get_tree().current_scene.get_node("/root/GamePlay/Player").score += 100
		queue_free()
	
