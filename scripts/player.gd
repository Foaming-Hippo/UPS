extends CharacterBody3D

const SPEED = 3.5
const SPRINT = 10
const ACCEL = 0.5
const JUMP_VELOCITY = 4.5
const MOUSE_SENS = 0.05

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var yaw = 0
var pitch = 0
var rotation_vect
var moving = false
var sprinting = false
var pew
var viewport_size

# Stats
var sucking = false
var keys = []
var health = 100
var mail = 0
var money = 0
signal update_stats
signal dead



func _ready():
	update_stats.emit()
	pew = get_node("Camera3D/Gun Pointer")
	#update_stats.emit()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_node("UI").get_tree().get_root().size_changed.connect(resize)
	resize()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		$PauseMenu.pause()


# <===== Player Stats =====>
# These can probably be refactored into 1 function
func change_health(amt):
	health += amt
	update_stats.emit()
	if health <= 0:
		dead.emit()


func add_key(key):
	keys.push_back(key)
	update_stats.emit()

func change_money(amt):
	money += amt
	update_stats.emit()

func change_mail(amt):
	mail += amt
	update_stats.emit()
# <==========>



# <===== Player Movement =====>
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("pewpew"):
		print(pew.get_collider())

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var aim = get_node("Camera3D").get_global_transform().basis
	var direction = Vector3()
	
	if Input.is_action_pressed("sprint") and Input.is_action_pressed("move_up"):
			sprinting = true
	else:
			sprinting = false
	
	if Input.is_action_pressed("move_up"):
		direction += aim[2]
		
	if Input.is_action_pressed("move_down"):
		direction -= aim[2]
		
	if Input.is_action_pressed("move_right"):
		direction -= aim[0]
	if Input.is_action_pressed("move_left"):
		direction += aim[0]
	
	if sprinting:
		velocity.x = -1 * direction.x * SPRINT
		velocity.z = -1 * direction.z * SPRINT
	else:
		velocity.x = -1 * direction.x * SPEED
		velocity.z = -1 * direction.z * SPEED

	move_and_slide()

func _input(delta):
	if delta is InputEventMouseMotion:
		yaw = fmod(yaw - delta.relative.x * MOUSE_SENS, 360)
		pitch = max(min(pitch - delta.relative.y * MOUSE_SENS, 85), -85)
		rotation_vect = Vector3(deg_to_rad(pitch), deg_to_rad(yaw), 0)

		get_node("Collision").set_rotation(rotation_vect)
		get_node("Camera3D").set_rotation(rotation_vect)
# <==========>




func resize():
	viewport_size = get_node("UI").get_viewport_rect().size
	get_node("SuckGunOverlay").custom_minimum_size = viewport_size
	print(viewport_size)
