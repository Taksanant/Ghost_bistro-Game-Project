extends Area2D

signal pie_picked_up

var v = Vector2(0, 0)
var player_in_collision = false

func _ready():
	pass

func _process(delta):
	v.x = 0

	if v.x == 0 and player_in_collision:
		$oven.play("bake")

	position += v

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			emit_signal("pie_picked_up")

