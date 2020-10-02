extends Area2D

export var speed: float = 750

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

func _on_Bomb_area_entered(area):
	if area.name == "Meteor" or area.name == "Enemy":
		area.damage(100)
