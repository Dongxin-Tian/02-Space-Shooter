extends Node2D

var plMeteor := preload("res://Scenes/Meteor.tscn")
var plEnemy := preload("res://Scenes/Enemy.tscn")

var enemyNumber = 0

func _ready():
	SpawnMeteor()
	
func SpawnMeteor():
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
	var meteor := plMeteor.instance()
	var pos = Vector2(rand_range(170, 625), -10)
	meteor.position = pos
	get_tree().current_scene.add_child_below_node(get_node("Player"), meteor)

	SpawnMeteor()
	t.queue_free()
	
func SpawnEnemy():
	if enemyNumber <= 3:
		var t = Timer.new()
		t.set_wait_time(3)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		
		var enemy := plEnemy.instance()
		#var pos = Vector2(rand_range(), rand_range())
		#enemy.position = pos
		#get_tree.current_scene.add_child_below_node(get_node("Player"), enemy)
		
		SpawnEnemy()
		t.queue_free()
