extends CPUParticles3D

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		emitting = event.pressed
