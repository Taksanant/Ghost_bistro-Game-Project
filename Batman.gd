extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var sumdelay = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sumdelay += delta
	if sumdelay > 0.2:
		sumdelay = 0
		if frame == 2:
			frame = 0
		else :
			frame += 1
	pass
