extends GPUParticlesAttractorVectorField3D

var CharacterBody3D
var GPUParticlesAttractorVectorField3D
var initial_rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	character = $Character
	object = $Object
	initial_rotation = GPUParticlesAttractorVectorField3D.rotation


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Set object's position relative to character's position
	GPUParticlesAttractorVectorField3D.translation = CharacterBody3D.translation + Vector3(0, 1, 0) # or any desired offset

	# Set object's rotation relative to character's rotation
	var rotation_difference = CharacterBody3D.rotation * initial_rotation.inverse()
	GPUParticlesAttractorVectorField3D.rotation = rotation_difference * CharacterBody3D.rotation


