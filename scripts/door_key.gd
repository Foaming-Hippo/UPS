extends Area3D

var overlap
var keys
var player
var sound
var move

# Called when the node enters the scene tree for the first time.
func _ready():
	print("hi")
	pass # Replace with function body.


# Called every frame. 'delta' i8s the elapsed time since the previous frame.
func _process(_delta):
	overlap = get_overlapping_areas()
	
	if get_overlapping_areas().size() > 0:
		player = get_overlapping_areas()[0].get_parent().get_parent()
		move = player.global_position
		
		if player is CharacterBody3D and player.sucking == true:
			get_parent().move_and_collide((move - get_parent().global_position) * _delta * 3)
			
			# Check if interacting with the player
			if get_overlapping_areas().size() > 1 and get_overlapping_areas()[1].get_parent() is CharacterBody3D:
				
				# Get the player's key array
				player.add_key(get_parent().get_meta("color"))
				get_parent().queue_free()
