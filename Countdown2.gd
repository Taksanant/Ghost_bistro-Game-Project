extends Control

func _ready():
	Reset_Timer()
	pass 

func _process(delta):
	pass

var sec = 0
var min = 0
var Dsec = 00
var Dmin = 2
var coinThreshold2 = 0

func _on_timer_timeout():
	if sec == 0 and min == 0:
		if Global.coin < coinThreshold2:
			# The player doesn't have enough coins, trigger a replay
			replay_level()
		else:
			# The player has enough coins, proceed to the next level or scene
			next_level()
	else:
		if sec == 0:
			if min > 0:
				min -= 1
				sec = 60
		sec -= 1
	$Label.text = str(min) + ":" + str(sec)

func Reset_Timer():
	sec=Dsec
	min = Dmin
func replay_level():
	Global.coin = 0
	Reset_Timer()
	get_tree().change_scene_to_file("res://replay.tscn")

func next_level():
	get_tree().change_scene_to_file("res://s_10.tscn")
  # Free the current countdown timer scene
