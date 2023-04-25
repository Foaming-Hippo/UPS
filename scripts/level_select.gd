extends Control

var viewport_size

func _ready() -> void:
	%levels.pressed.connect(level_menu)
	%upgrades.pressed.connect(upgrade_menu)
	%quit.pressed.connect(confirm_exit)
	%quitquit.pressed.connect(get_tree().quit)
	%dont_quit.pressed.connect(dont_exit)
	get_tree().get_root().size_changed.connect(resize)
	resize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func level_menu():
	%upgrade_menu.visible = false
	%level_menu.visible = true

func upgrade_menu():
	%upgrade_menu.visible = true
	%level_menu.visible = false

func confirm_exit():
	get_node("main_window").visible = false
	get_node("quit_fr").visible = true

func dont_exit():
	get_node("main_window").visible = true
	get_node("quit_fr").visible = false

func resize():
	viewport_size = get_viewport_rect().size
	get_node("TextureRect").custom_minimum_size = viewport_size
