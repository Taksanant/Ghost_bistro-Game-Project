extends Area2D

signal wine_picked_up

var v = Vector2(0, 0)
var player_in_collision = false

func _ready():
	pass

func _process(delta):
	v.x = 0

	if v.x == 0 and player_in_collision:
		$Wine_maker.play("make_wine")

	position += v

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if player_in_collision:
			emit_signal("wine_picked_up")

func _on_body_entered(body):
	if body.is_in_group("Player"):
		player_in_collision = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_in_collision = false
