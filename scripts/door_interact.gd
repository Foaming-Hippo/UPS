extends Area3D

var overlap
var player
var keys
var state
var dReady
var sound
var animation
var color

# Called when the node enters the scene tree for the first time.
func _ready():
	state = "closed"
	color = get_parent().get_meta("color")
	dReady = true
	sound = get_parent().get_node("AudioStreamPlayer3D")
	animation = get_parent().get_node("AnimationPlayer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for x in get_overlapping_areas():
		if x.get_parent().get_parent() is CharacterBody3D:
			player = x.get_parent().get_parent()
			keys = player.get_meta("keys")

			# Door has no color, open automatically
			if color == "" or color == null:
				if state == "open":
					return

				open()

			# Check if the player is pressing the interact key
			if not Input.is_action_pressed("interact"):
				return

			# If the door's color key is found, send open signal
			if keys.find(get_parent().get_meta("color")) >= 0:
				if state == "closed" and dReady:
					open()
				elif state == "open" and dReady:
					close()

func open():
	dReady = false
	state = "open"
	animation.play("open")
	await animation.animation_finished
	dReady = true
	
func close():
	dReady = false
	state = "closed"
	animation.play("close")
	await animation.animation_finished
	dReady = true
