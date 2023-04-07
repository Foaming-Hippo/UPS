extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var overlap = get_overlapping_areas()
	
	if overlap.size() > 0:
		var player = overlap[0].get_parent()
		var health = player.get_meta("Health")
		
		player.get_node("UI/player_info").add_health(50)
		
		get_parent().queue_free()
