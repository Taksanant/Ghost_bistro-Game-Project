extends Node2D

# Variables to control burger state.
var is_prepared = false
var is_served = false

# Called when the burger is prepared.
func prepare():
	is_prepared = true
	# You can add animations or effects to show the burger is prepared.

# Called when the burger is served to the customer.
func serve():
	is_served = true
	# You can add animations or effects to show the burger is served.

# Called when the customer is satisfied with their order.
func customer_satisfied():
	# Handle customer satisfaction logic here.
	queue_free()  # Destroy the burger object since it's no longer needed.

# Called when the customer leaves the table without eating.
func customer_displeased():
	# Handle customer displeased logic here.
	queue_free()  # Destroy the burger object since it's no longer needed.
