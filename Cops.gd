extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var overlap = get_overlapping_areas()
	if get_overlapping_areas().size() > 0:
		var player = overlap[0].get_parent()
		var move = get_overlapping_areas()[0].get_parent().global_position
		var health = player.get_meta("Health")
		
		if get_parent().move_and_collide((move - get_parent().global_position) * delta * 2) != null:
			get_overlapping_areas()[0].get_parent().get_node("UI/player_info").set_health(health - 10)

