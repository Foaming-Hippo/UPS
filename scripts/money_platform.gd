extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var overlap = get_overlapping_areas()
	
	if overlap.size() > 0:
		var player = overlap[0].get_parent()

		if player.get_node("UI/player_info").mail > 0:
			player.get_node("UI/player_info").add_mail(-1)
			player.get_node("UI/player_info").add_money(randi() % 50)
	pass
