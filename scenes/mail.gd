extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# FIXME: this is awful
	if get_overlapping_areas().size() > 0:
		print("hola")
		var move = get_overlapping_areas()[0].get_parent().get_parent().global_position
		
		
		if get_parent().move_and_collide((move - get_parent().global_position) * _delta * 3) != null:
			get_overlapping_areas()[0].get_parent().get_parent().get_node("UI/player_info").add_mail(1)
			get_parent().queue_free()
