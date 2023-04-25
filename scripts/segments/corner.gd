extends Node3D

var spaces = [Vector3(0, 0, 0)]
var offset = [Vector3(0, 0, -7), Vector3(-7, 0, 0)]
var child_offset = [Vector3(0, 0, 0), Vector3(0, 0, 0)]
var end = [ROOMS.type.HALLWAY_DOWN, ROOMS.type.HALLWAY_LEFT]

var compatibility_end = []
var compatibility_offset = []

func init():
	compatibility_end.append_array(end)
	compatibility_end.append_array([ROOMS.type.HALLWAY_UP, ROOMS.type.HALLWAY_RIGHT])

	compatibility_offset.append_array(offset)
	compatibility_offset.append_array([Vector3(0, 0, 7), Vector3(7, 0, 0)])
