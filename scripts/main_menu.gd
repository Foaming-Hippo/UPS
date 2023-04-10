extends Control

@onready var play_button: Button = find_child("Play")
@onready var quit_button: Button = find_child("Quit")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(play)
	quit_button.pressed.connect(quit)

func quit():
	get_tree().quit()

func play():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
