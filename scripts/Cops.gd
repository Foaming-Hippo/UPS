extends Area3D

var parent
var player
var move
var overlap
const SPEED = 2.5

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	overlap = get_overlapping_areas()
	if get_overlapping_areas().size() > 0:
		player = overlap[0].get_parent()
		move = player.global_position
		
		# Check if it is the player
		if player is CharacterBody3D:
			print(move - get_parent().global_position)
			parent.velocity.z = move[2] - parent.global_position[2]
			parent.velocity.x = move[0] - parent.global_position[0]
			
			if abs(parent.velocity.z) > 2 or abs(parent.velocity.x) > 2:
				parent.move_and_slide()


func _on_timer_timeout():
	if player == null:
		return

	if abs(parent.velocity.z) < 3.6 and abs(parent.velocity.x) < 3.6:
		player.change_health(-10)
