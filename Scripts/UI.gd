extends Control

onready var player = get_node("../Player")

func _process(delta):
	$ScoreVar.text = str(player.score)
	#var temp = ""
	#for i in range(player.lives):
		#temp += "♥"
	#$LivesVar.text = str(temp)
	$LivesVar.text = str(player.lives)
	$BombsVar.text = str(player.bombs)
	$PowerVar.text = str(player.power)
