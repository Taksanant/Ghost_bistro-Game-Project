extends Area2D

signal pot_picked_up
var player_in_collision = false
var v = Vector2(0,0)

func _ready():
	pass
	
func _process(delta):
	v.x = 0

	
	if v.x == 0:
		$AnimatedSprite2D.play("Boil")

	position += v
func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if player_in_collision == true:
		
			emit_signal("pot_picked_up")
func _on_body_entered(body):
	if body.is_in_group("Player"):
		player_in_collision = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_in_collision = false
