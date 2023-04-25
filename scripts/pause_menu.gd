extends ColorRect

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = find_child("ResumeButton")
@onready var main_button: Button = find_child("MainMenu")
@onready var restart_button: Button = find_child("RestartButton")

func _ready() -> void:
	play_button.pressed.connect(unpause)
	main_button.pressed.connect(mainmenu)
	restart_button.pressed.connect(restart)

func mainmenu():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func restart():
	get_tree().reload_current_scene()
	animator.play("Unpause")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func unpause():
	animator.play("Unpause")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func pause():
	animator.play("Pause")
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
