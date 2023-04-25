extends Node3D

var spaces = [Vector3(0, 0, 0)]
var offset = []
var end = []

var compatibility_end = []
var compatibility_offset = []

func init():
	compatibility_end.append_array(end)

	compatibility_offset.append_array(offset)
