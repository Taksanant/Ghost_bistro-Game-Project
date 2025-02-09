extends CharacterBody2D
@onready var sink_sfx =$sink
@onready var wine_sfx = $wine
@onready var pot_sfx = $pot
@onready var oven_sfx = $Oven

var v = Vector2(0, 0)
var speed = 5
var pot_instance
var pot_picked_up = false
var wine_instance
var wine_picked_up = false
var oven_instance
var pie_picked_up = false
var food_held = null
var can_interact = true
var selected_customer = null
var inhand_order = null
var food_order = []
var food_price = null


func _ready():
	pot_instance = preload("res://brain_soup.tscn").instantiate()
	wine_instance = preload("res://wine.tscn").instantiate()
	oven_instance = preload("res://pie.tscn").instantiate()
	
func _process(delta):
	v.x = 0
	v.y = 0

	if Input.is_action_pressed("move_forward"):
		v.y = -speed
	if Input.is_action_pressed("move_left"):
		v.x = -speed
	if Input.is_action_pressed("move_right"):
		v.x = speed
	if Input.is_action_pressed("move_back"):
		v.y = speed

	if position.y >= 650 && v.y > 0: v.y = 0
	if position.y <= 250 && v.y < 0: v.y = 0

	if position.x <= 200 && v.x < 0: v.x = 0
	if position.x >= 340 && v.x > 0: v.x = 0

	if v.x < 0:
		$player.play("walk_left")
	if v.x > 0:
		$player.play("walk_right")

	if v.y < 0:
		$player.play("walk_forward")
	if v.y > 0:
		$player.play("walk_back")
	position += v

	if food_held:
		var offset = Vector2(5, -70) 
		food_held.global_position = $player.global_position + offset

func _input(event):
	if Input.is_action_pressed("serve"):
		if can_interact and selected_customer:
			serve_customer()

func serve_customer():
	if selected_customer and inhand_order:
		var payment = 0
		#food_price = Global.order_price
		
		food_order = selected_customer.order_data["name"]
		var chair_index = get_parent().find_chair_index(selected_customer)
		if food_order == inhand_order:
				payment = food_price
				print("inhand_order"+inhand_order)
		else:
				payment = food_price / 3
				print("inhand_order"+inhand_order)
	
		food_held = null
		pot_instance.visible = false
		wine_instance.visible = false
		oven_instance.visible = false
		print("Customer paid:", payment)
		print(food_order)
		
		Global.coin += payment
		selected_customer.queue_free() 
		print("customer leaving") # Remove the customer
		selected_customer = null
		if chair_index >= 0:
			get_parent().call("customer_left", chair_index)


func _on_wine_picked_up():
	if not food_held:
		print("Wine picked up!")
		wine_sfx.play()
		wine_instance.visible = true
		food_held = wine_instance
		display_food_above_head(food_held)
		inhand_order = "Blood wine" 
		food_price = 6  
func _on_pot_picked_up():
	if not food_held:
		print("Soup picked up!")
		pot_sfx.play()
		pot_instance.visible = true
		food_held = pot_instance
		display_food_above_head(food_held)
		inhand_order = "Brain Soup"
		food_price = 8
func _on_pie_picked_up():
	if not food_held:
		oven_sfx.play()
		print("Pie picked up!")
		oven_instance.visible = true
		food_held = oven_instance
		display_food_above_head(food_held)
		inhand_order = "Pumpkin pie"
		food_price = 12
func display_food_above_head(food_instance):
	if food_instance:
		var offset = Vector2(5, -70) 
		food_instance.position = $player.global_position + offset
		get_parent().add_child(food_instance)

func _on_food_throw():
	if food_held != null:
		print("throw food")
		sink_sfx.play()
		food_held = null
		pot_instance.visible = false
		wine_instance.visible = false
		inhand_order = null

func player_serve_method():
	pass
