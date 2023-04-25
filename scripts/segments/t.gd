extends Node3D

var spaces = [Vector3(0, 0, 0)]
var offset = [Vector3(-7, 0, 0), Vector3(0, 0, -7), Vector3(7, 0, 0)]
var child_offset = [Vector3(0, 0, 0), Vector3(0, 0, 0), Vector3(0, 0, 0)]
var end = [ROOMS.type.HALLWAY_LEFT, ROOMS.type.HALLWAY_DOWN, ROOMS.type.HALLWAY_RIGHT]

var compatibility_end = []
var compatibility_offset = []

func init():
	compatibility_end.append_array(end)
	compatibility_end.push_back(ROOMS.type.HALLWAY_UP)
	
	compatibility_offset.append_array(offset)
	compatibility_offset.push_back(Vector3(0, 0, 7))
