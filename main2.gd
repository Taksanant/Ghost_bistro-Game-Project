extends Node2D

var mob = preload("res://Customer2.tscn")
var entrys_point = [$entry1, $entry2, $entry3]
var chairs_point = [$chair1, $chair2, $chair3]
var available_chairs = [true, true, true]  # Track available chairs
var occupied_chairs = [-1, -1, -1]  # Track occupied chairs

var coinThreshold2 = 80
func _ready():
	# Instantiate the CountdownTimer and pass the coinThreshold value
	var countdown_timer2 = preload("res://countdown_2.tscn").instantiate()
	countdown_timer2.coinThreshold2 = coinThreshold2  # Pass the coinThreshold value
	add_child(countdown_timer2)
	entrys_point = [$entry1, $entry2, $entry3]
	chairs_point = [$chair1, $chair2, $chair3]
	print("Main scene ready")
	spawn_monster()
	spawn_monster()
	spawn_monster()
	Global.coin = 0
	$Bg_music.play()

func spawn_monster():
	var empty_chair_index = -1  # Initialize with an invalid value

	# Find the index of the first available chair
	for i in range(3):
		if available_chairs[i]:
			empty_chair_index = i
			break

	if empty_chair_index >= 0:
		var mob_instance = mob.instantiate()
		mob_instance.position = entrys_point[empty_chair_index].position
		mob_instance.destination = chairs_point[empty_chair_index].position
		add_child(mob_instance)
		available_chairs[empty_chair_index] = false
		occupied_chairs[empty_chair_index] = mob_instance  # Track occupied chair

func customer_left(chair_index):
	available_chairs[chair_index] = true  # Mark the chair as available
	occupied_chairs[chair_index] = -1  # Mark the chair as unoccupied
	spawn_monster()  # Spawn a new customer when one leaves
func find_chair_index(customer_node):
	for i in range(3):
		if occupied_chairs[i] == customer_node:
			return i
	return -1  # Customer not found in any chair
func _physics_process(delta):
	$cointext.text = (str(Global.coin))
