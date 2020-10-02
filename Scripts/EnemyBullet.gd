extends Area2D

var direction : Vector2 = Vector2.LEFT
var speed : float = 100

func _process(delta):
	translate(direction*speed*delta)
	
	if position.x >= 660 or position.x <= 140 or position.y >= 620 or position.y <= -10:
		queue_free()

func _on_EnemyBullet_body_entered(body):
	if body.get_name() == "Player":
		body.die()
		queue_free()
