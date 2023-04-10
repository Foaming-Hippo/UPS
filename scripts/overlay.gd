extends TextureRect




func _ready():
	var screen_size_i = get_viewport().size
	var screen_size = Vector2(screen_size_i.x, screen_size_i.y)
	var center = screen_size / 2
	var canvas_size = size
	var canvas_position = center - canvas_size / 2
	set_position(canvas_position)
	set_custom_minimum_size(screen_size)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

