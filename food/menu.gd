extends Node
#@onready var instance = preload("res://menu.tscn").instantiate()
# Define your menu items as an array of dictionaries.
var menu2 = [
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
	}
	# Add more menu items as needed.
]

# Function to get a random menu item.
func get_random_order() -> Dictionary:
	var random_index = randi() % menu2.size()
	return menu2[random_index]
