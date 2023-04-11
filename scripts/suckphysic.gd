extends GPUParticlesAttractorVectorField3D

var attractor_strength = -30
var player
var sound1
var sound2

func _ready():
	player = get_parent().get_parent()
	sound1 = player.get_node("AudioStreamPlayer3D")
	sound2 = player.get_node("AudioStreamPlayer3D2")
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			player.set_meta("sucking", true)
			sound1.stream = load("res://models/sounds/slurp2.tres")
			sound1.play()
			strength = attractor_strength
		else:
			player.set_meta("sucking", false)
			sound1.stop()
			sound2.stream = load("res://models/sounds/slurp3.tres")
			sound2.play()
			strength = 0.0
