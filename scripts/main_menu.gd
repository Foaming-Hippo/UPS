extends Control

var viewport_size
@onready var play_button: Button = find_child("play")
@onready var quit_button: Button = find_child("quit")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(play)
	quit_button.pressed.connect(quit)
	get_tree().get_root().size_changed.connect(resize)
	resize()

func quit():
	get_tree().quit()

func play():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
	get_tree().paused = false

func resize():
	viewport_size = get_viewport_rect().size
	get_node("TextureRect").custom_minimum_size = viewport_size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
