extends Area3D

var overlap
var keys
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	print("hi")
	pass # Replace with function body.


# Called every frame. 'delta' i8s the elapsed time since the previous frame.
func _process(_delta):
	overlap = get_overlapping_areas()
	
	# Player walks within key pickup range
	if overlap.size() > 0:
		# Get the node of the player
		player = overlap[0].get_parent()
		
		# Get the player's key array
		keys = player.get_meta("keys")
		# Add the key
		keys.push_back(get_parent().get_meta("color"))
		# Give the player the new key array
		player.set_meta("keys", keys)
		
		player.get_node("UI/player_info").add_key(get_parent().get_meta("color"))
		
		# Destroy the key object
		get_parent().queue_free()
