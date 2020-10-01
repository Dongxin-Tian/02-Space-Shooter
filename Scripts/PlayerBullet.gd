extends Area2D

export var speed: float = 500

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

func _physics_process(delta):
	position.y -= speed * delta
