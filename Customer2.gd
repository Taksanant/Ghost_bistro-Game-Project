extends CharacterBody2D

var menu_items = preload("res://food/menu2.gd")
var speed = 150
var destination = Vector2()  # This will store the destination for each mob
var stopped = false
var chairs_point = [$chair1, $chair2, $chair3]
# Instance of the MenuItems script.
var menu_instance = menu_items.new()  # Create an instance of the script.
var order_time = 0
var order_data = {}
var order_showing = false
var click = Global.click
var order = null 

func _ready():
	print(should_order())
	print(position.x)
	if should_order():
		order = menu_instance.get_random_order()
		place_order(order)
	chairs_point = [$chair1, $chair2, $chair3]

	var mob_types = $boo2.sprite_frames.get_animation_names()
	$boo2.play(mob_types[randi() % mob_types.size()])

func _process(delta):
	if !stopped:
		var direction = (destination - position).normalized()
		var movement = direction * speed * delta
		if should_order():
			place_order(order_data)

		position += movement
		for i in range(3):
			if position.distance_to(chairs_point[i].position) < 10:
				stopped = true

func should_order() -> bool:
	return position.x >= 505 

func place_order(order_data: Dictionary):
	if !order_showing:
		self.order_data = order_data
		self.order_time = Time.get_ticks_msec()
		var order_scene = order_data["food_scene"]
		var order_instance = order_scene.instantiate()
		get_parent().add_child(order_instance)
		update_order_sprite(order_data)
		order_showing = true
		$OrderHide.wait_time = 6
		$OrderHide.start()

func update_order_sprite(order_data: Dictionary):
	var order_sprite = $order_sprite  
	var order_texture = order_data["order_image"]
	order_sprite.texture = order_texture
	order_sprite.visible = false
	order_sprite.offset = Vector2(0, -32)

func _on_order_hide_timeout():
	if order_showing:
		var order_sprite = $order_sprite
		order_sprite.visible = true
		$OrderHide.stop()
		$OrderShow.wait_time = 3
		$OrderShow.start()

func _on_order_show_timeout():
	if order_showing:
		
		var order_sprite = $order_sprite
		order_sprite.visible = false
		$OrderShow.stop() 
		order_showing = false
		

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		click = true

func reset_customer_state():
	order_showing = false

