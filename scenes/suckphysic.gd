extends GPUParticlesAttractorVectorField3D

var attractor_strength = -30

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			strength = attractor_strength
		else:
			strength = 0.0
