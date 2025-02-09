extends Control

var v = Vector2(0,0)

func _ready():
	pass
	
func _process(delta):
	pass
# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_action_pressed("enter"):
		get_tree().change_scene_to_file("res://main2.tscn")
		pass # Replace with function body.
