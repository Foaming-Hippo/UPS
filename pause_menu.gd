extends ColorRect

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = find_child("ResumeButton")
@onready var main_button: Button = find_child("MainMenu")
@onready var new_button: Button = find_child("NewButton")
@onready var test_button: Button = find_child("TestButton")
@onready var restart_button: Button = find_child("RestartButton")

func _ready() -> void:
	play_button.pressed.connect(unpause)
	new_button.pressed.connect(newlevel)
	main_button.pressed.connect(mainmenu)
	restart_button.pressed.connect(restart)
	test_button.pressed.connect(test)

func mainmenu():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func test():
	get_tree().change_scene_to_file("res://scenes/TestLevel.tscn")
	animator.play("Unpause")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func newlevel():
	get_tree().change_scene_to_file("res://level_1.tscn")
	animator.play("Unpause")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

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
