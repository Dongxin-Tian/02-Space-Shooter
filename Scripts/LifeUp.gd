extends Area2D

func _process(delta):
	position.y += 150 * delta
	
	if position.x >= 660 or position.x <= 140 or position.y >= 620 or position.y <= -10:
		queue_free()

func _on_LifeUp_body_entered(body):
	if body.get_name() == "Player":
		body.lives += 1
		queue_free()
