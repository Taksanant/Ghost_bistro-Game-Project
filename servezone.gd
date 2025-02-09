extends Area2D

var customer_entered = false

var customer = null
var spawn_cus = preload("res://main.gd")

func _ready():
	pass


# Function to handle the customer entering the serve zone
func _on_body_entered(body):
	if body.is_in_group("Customer"):
		customer = body
		
		customer_entered = true
		
	if customer_entered:
		if body.has_method("player_serve_method"):
			var player = body
			player.selected_customer = customer

func _on_body_exited(body):
	if body.is_in_group("Customer"):
		customer_entered = false

	if customer_entered:
		if body.has_method("player_serve_method"):
			var player = body
			player.selected_customer = null

