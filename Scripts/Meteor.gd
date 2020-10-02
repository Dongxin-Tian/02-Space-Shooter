extends Area2D

var spd
var life: int = 0

var im_enemy = true

func _ready():
	spd = rand_range(50, 100)
	var sca = rand_range(0.1, 0.3)
	scale = Vector2(sca, sca)
	life = randi()%10+5

func _physics_process(delta):
	position.y += spd * delta
	if position.y >= 625:
		queue_free()
		
func damage(amount: int):
	life -= amount
	if life <= 0:
		get_tree().current_scene.get_node("/root/GamePlay/Player").score += 100
		queue_free()

func _on_Meteor_body_entered(body):
	if body.get_name() == "Player":
		body.die()
		queue_free()
		
