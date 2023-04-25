extends Area3D

var move
var player
var sound
var distance
var collider

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Itterate over the overlapping areas, begin suck if the player is one of them
	for x in get_overlapping_areas():
		if x.get_parent().get_parent() is CharacterBody3D:
			player = x.get_parent().get_parent()
			move = player.global_position
			
			# Do nothing if not sucking
			if player.sucking != true:
				return
				
			# Put the mail in motion, pass until it collides with the player
			collider = get_parent().move_and_collide((move - get_parent().global_position) * _delta * 5)
			if collider == null:
				return
			# Only delete the mail if the object it collides with is close to the player
			# (otherwise the mail can collide with each other and delete themselves early
			elif abs(collider.get_position() - move) > Vector3(.6, .6, .6):
				return
			
			player.change_mail(1)
			get_parent().queue_free()
