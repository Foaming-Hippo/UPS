extends Area3D

var move
var player
var sound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# FIXME: this is awful
	if get_overlapping_areas().size() > 0:
		player = get_overlapping_areas()[0].get_parent().get_parent()
		move = player.global_position
		sound = player.get_node("AudioStreamPlayer3D2")
		
		if player.get_meta("sucking") == true:
			if get_parent().move_and_collide((move - get_parent().global_position) * _delta * 3) != null:
				player.get_node("UI/player_info").add_mail(1)
				sound.stream = load("res://models/sounds/pop.tres")
				sound.play()
				get_parent().queue_free()
