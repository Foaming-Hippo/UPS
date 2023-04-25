extends Node

enum type {HALLWAY_UP, HALLWAY_DOWN, HALLWAY_LEFT, HALLWAY_RIGHT}

var reverse_type = [0, 0, 0, 0]
var rooms = [[], [], [], []]


# Called when the node enters the scene tree for the first time.
func _ready():
	rooms[type.HALLWAY_DOWN] = ["res://scenes/segments/middle_room.tscn", "res://scenes/segments/tri_room_right.tscn", "res://scenes/segments/tri_room.tscn"]
	rooms[type.HALLWAY_UP] = ["res://scenes/segments/middle_room.tscn", "res://scenes/segments/tri_room_right.tscn", "res://scenes/segments/tri_room.tscn"]
	rooms[type.HALLWAY_LEFT] = ["res://scenes/segments/middle_room.tscn", "res://scenes/segments/tri_room_right.tscn"]
	rooms[type.HALLWAY_RIGHT] = ["res://scenes/segments/middle_room.tscn", "res://scenes/segments/tri_room.tscn"]
	
	reverse_type[type.HALLWAY_DOWN] = type.HALLWAY_UP
	reverse_type[type.HALLWAY_UP] = type.HALLWAY_DOWN
	reverse_type[type.HALLWAY_LEFT] = type.HALLWAY_RIGHT
	reverse_type[type.HALLWAY_RIGHT] = type.HALLWAY_LEFT

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
