extends Area3D

var overlap
var player
var keys
var state
var dReady
var sound
var animation

# Called when the node enters the scene tree for the first time.
func _ready():
	state = "closed"
	dReady = true
	sound = get_parent().get_node("AudioStreamPlayer3D")
	animation = get_parent().get_node("AnimationPlayer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	overlap = get_overlapping_areas()

	# If there is an overlapping area, check if the player has the key
	if overlap.size() > 0 and Input.is_action_pressed("interact"):
		# Get player node
		player = overlap[0].get_parent().get_parent()
		# Get player's keys
		keys = player.get_meta("keys")
		
		# If the door's color key is found, send open signal
		if keys.find(get_parent().get_meta("color")) >= 0:
			if state == "closed" and dReady:
				dReady = false
				state = "open"
				animation.play("open")
				await animation.animation_finished
				dReady = true
			elif state == "open" and dReady:
				dReady = false
				state = "closed"
				animation.play("close")
				await animation.animation_finished
				dReady = true
