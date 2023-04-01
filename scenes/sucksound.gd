extends AudioStreamPlayer

var press_sound: AudioStream
var hold_sound: AudioStream
var release_sound: AudioStream

var player: AudioStreamPlayer
var was_pressed: bool = false

func _ready():
	# Load the sound files and create an AudioStreamPlayer node
	press_sound = load("res://models/sounds/slurp1.tres")
	hold_sound = load("res://models/sounds/slurp2.tres")
	release_sound = load("res://models/sounds/slurp3.tres")
	player = AudioStreamPlayer.new()
	add_child(player)

func _process(delta: float) -> void:
	# Check if the left mouse button is pressed
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		player.stop()  # Stop any currently playing sound
		player.stream = press_sound
		player.play()
		await (1.21)
		print("hi")
		

