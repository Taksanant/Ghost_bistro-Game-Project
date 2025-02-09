extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = 3
	$Timer.start()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if Input.is_action_pressed("skip"):
		_on_timer_timeout()
		pass # Replace with function body.


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://s_13.tscn")
	pass # Replace with function body.
