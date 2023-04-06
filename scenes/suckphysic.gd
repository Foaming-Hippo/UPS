extends GPUParticlesAttractorVectorField3D

var attractor_strength = -30
var sound1
var sound2

func _ready():
	sound1 = get_parent().get_parent().get_parent().get_node("AudioStreamPlayer3D")
	sound2 = get_parent().get_parent().get_parent().get_node("AudioStreamPlayer3D2")
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			strength = attractor_strength
			sound1.stream = load("res://models/sounds/slurp1.tres")
			sound1.play()
			await sound1.finished
			sound2.stream = load("res://models/sounds/slurp2.tres")
			sound1.stop()
			sound2.play()
		else:
			sound1.stream = load("res://models/sounds/slurp3.tres")
			sound1.play()
			sound2.stop()
			strength = 0.0
