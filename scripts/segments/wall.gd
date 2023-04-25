extends Node3D

var spaces = []
var offset = []
var check_spaces = [Vector3(0, 0, -3.19), Vector3(0, 0, 3.19), Vector3(-3.19, 0, 0), Vector3(3.19, 0, 0)]
var child_offset = [Vector3(0, 0, 1.75), Vector3(0, 0, -1.75), Vector3(1.75, 0, 0), Vector3(-1.75, 0, 0)]
var rotation_offset = [-3.14159, 0, -1.5708, 1.5708]
var end = []

var compatibility_end = []
var compatibility_offset = []

func init():
	compatibility_end.append_array(end)

	compatibility_offset.append_array(offset)
