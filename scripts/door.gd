extends StaticBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# If the player is not looking at the door, close it
	if not get_meta("action"):
		d_move("close")
		
	# If the player is looking at the door, open it
	else:
		d_move("open")


func d_move(state):
	# Move the door up or down according to `state`
	if state == "open":
		move_and_collide(Vector3(0, -0.05, 0))
	elif state == "close":
		move_and_collide(Vector3(0, 0.05, 0))
