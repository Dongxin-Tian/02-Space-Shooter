extends Area2D

export var speed: float = 300

func _ready():
	# Delay destroy
	var t = Timer.new()
	t.set_wait_time(2)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	queue_free()
	t.queue_free()

func _process(delta):
	if position.y <= 1:
		queue_free()

func _physics_process(delta):
	position.y -= speed * delta

func _on_Bomb_area_entered(area):
	if "im_enemy" in area:
		area.damage(100)
