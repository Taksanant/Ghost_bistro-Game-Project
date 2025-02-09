extends Control

var v = Vector2(0,0)

func _ready():
	pass
	
func _process(delta):
	v.x = 0

	
	if v.x == 0:
		$AnimatedSprite2D.play("yongx2")

	position += v
# Called when the node enters the scene tree for the first time.


func _on_button_pressed():
	get_tree().change_scene_to_file("res://s_1.tscn")
	pass # Replace with function body.
