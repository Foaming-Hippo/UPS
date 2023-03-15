extends CharacterBody3D


const SPEED = 3.5
const ACCEL = 0.5
const JUMP_VELOCITY = 4.5
const MOUSE_SENS = 0.05

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var yaw = 0
var pitch = 0
var rotation_vect
var moving = false


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var aim = get_node("Camera3D").get_global_transform().basis
	var direction = Vector3()
	
	if Input.is_action_pressed("move_up"):
		direction += aim[2]
	if Input.is_action_pressed("move_down"):
		direction -= aim[2]
		
	if Input.is_action_pressed("move_right"):
		direction -= aim[0]
	if Input.is_action_pressed("move_left"):
		direction += aim[0]
	
	
	velocity.x = -1 * direction.x * SPEED
	velocity.z = -1 * direction.z * SPEED

	move_and_slide()

func _input(delta):
	if delta is InputEventMouseMotion:
		yaw = fmod(yaw - delta.relative.x * MOUSE_SENS, 360)
		pitch = max(min(pitch - delta.relative.y * MOUSE_SENS, 85), -85)
		rotation_vect = Vector3(deg_to_rad(pitch), deg_to_rad(yaw), 0)

		get_node("CollisionShape3D").set_rotation(rotation_vect)
		get_node("Camera3D").set_rotation(rotation_vect)

