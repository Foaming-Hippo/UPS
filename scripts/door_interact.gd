extends Area3D

var overlap
var player
var keys
var state
var sound

# Called when the node enters the scene tree for the first time.
func _ready():
	sound = get_parent().get_node("AudioStreamPlayer3D")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	overlap = get_overlapping_areas()
	
	# If not areas are overlapping, set door action to false so it will close
	if overlap.size() == 0 and state == "open":
		state = "closed"
		sound.stream = load("res://models/sounds/door_close.mp3")
		sound.play()
		get_parent().get_node("AnimationPlayer").play_backwards("open")
	
	# If there is an overlapping area, check if the player has the key
	elif overlap.size() > 0 and Input.is_action_pressed("interact"):
		# Get player node
		player = overlap[0].get_parent().get_parent()
		# Get player's keys
		keys = player.get_meta("keys")
		
		# If the door's color key is found, send open signal
		if keys.find(get_parent().get_meta("color")) >= 0:
			state = "open"
			sound.stream = load("res://models/sounds/door_open.mp3")
			sound.play()
			get_parent().get_node("AnimationPlayer").play("open")
