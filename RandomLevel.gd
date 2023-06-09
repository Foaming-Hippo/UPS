extends Node3D

var segment
var segment_instance
var segment_positions = []
var segment_instances = []
var seg_list = []
var end_list = []

# Called when the node enters the scene tree for the first time.
func _ready():
	segment = load("res://scenes/segments/middle_room.tscn")
	segment_instance = segment.instantiate()
	add_child(segment_instance)
	for y in segment_instance.spaces:
			segment_positions.push_back(segment_instance.transform.origin + y)
			segment_instances.push_back(segment_instance)
	end_list.push_back(segment_instance)
	
	for fff in 3:
		# Save generated ends to seg_list to iterate over
		seg_list.clear()
		seg_list.append_array(end_list)
		# Clear end_list so it only has the newly generated ends
		end_list.clear()

		for x in seg_list:
			end_list += generate_ends(x, x.transform.origin)

	print(end_list)
	for x in end_list:
		snip_ends(x, x.transform.origin)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		get_tree().reload_current_scene()

# Generate a compatible segment for each end on the provided segement,
# then return a list of all the generated segments
func generate_ends(segment_instance, position):
	var new_segment
	var new_segment_instance
	var error_segment
	var error_segment_instance
	var adjacent_position
	var compatible = true
	var generated_ends = []

	for x in segment_instance.end.size():
		new_segment = load(random_segment(segment_instance.end[x]))
		new_segment_instance = new_segment.instantiate()
		new_segment_instance.init()
		# Move the new segment into place
		print(segment_instance.offset[x])
		print(new_segment_instance.child_offset[x])
		
		if segment_instance.offset[x] == null or new_segment_instance.child_offset[x] == null:
			continue
			
		new_segment_instance.transform.origin = position + segment_instance.offset[x] + new_segment_instance.child_offset[x]
		
		# Do not add segments that would overlap existing segments
		if calculate_overlap(segment_instance, segment_instance.offset[x] + new_segment_instance.child_offset[x], position, segment_positions):
			continue
			
		# For each generated segment, check each of it's ends and see if it is compatible
		if not calculate_compatible(new_segment_instance, segment_instance, segment_positions):
			snip_end(segment_positions, segment_instance, x, position)
			continue

		add_child(new_segment_instance)
		# Add to the return list and record the position to prevent overlapping
		for y in new_segment_instance.spaces:
			segment_positions.push_back(new_segment_instance.transform.origin + y)
			segment_instances.push_back(new_segment_instance)
		generated_ends.push_back(new_segment_instance)
	
	return generated_ends



func snip_ends(segment_instance, position):
	var child_segment = load("res://scenes/segments/wall.tscn")
	var child_segment_instance
	
	for x in segment_instance.end.size():
		child_segment_instance = child_segment.instantiate()
		child_segment_instance.init()

		if segment_instance.offset[x] == null or child_segment_instance.child_offset[x] == null:
			continue

		child_segment_instance.transform.origin = position + segment_instance.offset[x] + child_segment_instance.child_offset[x]
		child_segment_instance.rotate_y(child_segment_instance.rotation_offset[ROOMS.reverse_type[x]])

		if contains_vector(segment_positions, position + segment_instance.offset[x] + child_segment_instance.check_spaces[x]):
			print("uhm, occupied")
			continue

		# Do not add segments that would overlap existing segments
		#if calculate_overlap(segment_instance, segment_instance.offset[x] + child_segment_instance.child_offset[x], position, segment_positions):
		#	continue
		
		add_child(child_segment_instance)
		segment_positions.push_back(child_segment_instance.transform.origin)



func snip_end(segment_positions, parent_segment, end, position):
	var child_segment = load("res://scenes/segments/wall.tscn")
	var child_segment_instance = child_segment.instantiate()
	child_segment_instance.init()
	
	if segment_instance.offset[end] == null or child_segment_instance.child_offset[end] == null:
		return 1
	
	child_segment_instance.transform.origin = position + parent_segment.offset[end] + child_segment_instance.child_offset[end]
	child_segment_instance.rotate_y(child_segment_instance.rotation_offset[ROOMS.reverse_type[end]])

	# Do not add segments that would overlap existing segments
	if calculate_overlap(segment_instance, parent_segment.offset[end] + child_segment_instance.child_offset[end], position, segment_positions):
		return 0
	
	add_child(child_segment_instance)
	segment_positions.push_back(child_segment_instance.transform.origin)
	return 0



func random_segment(type):
	var index = randi_range(0, ROOMS.rooms[type].size() - 1)
	return ROOMS.rooms[type][index]



func contains_vector(look_inside, look_for):
	for x in look_inside:
		if x.is_equal_approx(look_for):
			return true
	return false



func vector_find(look_inside, look_for):
	for x in look_inside.size():
		if look_inside[x].is_equal_approx(look_for):
			return x
	return -1



func calculate_overlap(segment_instance, offset, position, segment_positions):
	for x in segment_instance.spaces:
		if contains_vector(segment_positions, position + offset + x):
			return true
	return false



func calculate_compatible(child_segment, parent_segment, segment_positions):
	var adjacent_position
	var adjacent_segment
	
	for x in child_segment.compatibility_end.size():
		adjacent_position = child_segment.transform.origin + child_segment.compatibility_offset[x]
		adjacent_segment = segment_instances[vector_find(segment_positions, adjacent_position)]

		# Do nothing if the segment is the parent
		if adjacent_segment == parent_segment:
			continue
		# Do nothing if there is no segment
		if vector_find(segment_positions, adjacent_position) == -1:
			continue

		# Probably useless, comes from old algorythm. Needs more testing
		if child_segment.compatibility_end.size() > adjacent_segment.end.size():
			print("the mf is not supposed to be there")
			return false

		# If the reverse of the childs end is not in the adjacent's end's, they are incompatible 
		if ROOMS.reverse_type[child_segment.end[x]] in adjacent_segment.end:
			print("that mf is also not allowed, get tf out")
			return false
		
		if not child_segment.transform.origin + child_segment.offset[x] + adjacent_segment.child_offset[x] == adjacent_segment.transform.origin + adjacent_segment.offset[x]:
			print("man none of these work huh")
			return false

		#print(adjacent_segment.end)
	return true
