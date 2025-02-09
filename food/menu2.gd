extends Node
#@onready var instance = preload("res://menu.tscn").instantiate()
# Define your menu items as an array of dictionaries.
var menu = [
	{
		"name": "Blood wine",
		"price": 6,
		"food_scene": preload("res://wine.tscn"),
		"order_image": preload("res://food/bloodwineOrder.png") # Link to the order image resource.
	},
	{
		"name": "Brain Soup",
		"price": 8,
		"food_scene": preload("res://brain_soup.tscn"),
		"order_image": preload("res://food/brainSoupOrder.png")
	},{
		"name": "Pumpkin pie",
		"price": 12,
		"food_scene": preload("res://pie.tscn"),
		"order_image": preload("res://food/pie_order.png")
	}
	# Add more menu items as needed.
]

# Function to get a random menu item.
func get_random_order() -> Dictionary:
	var random_index = randi() % menu.size()
	return menu[random_index]
