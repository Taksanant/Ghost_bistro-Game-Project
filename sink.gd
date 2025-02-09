extends Area2D

signal food_throw
var player_in_collision = false

func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if player_in_collision == true:
		
			emit_signal("food_throw")
func _on_body_entered(body):
	if body.is_in_group("Player"):
		player_in_collision = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_in_collision = false
