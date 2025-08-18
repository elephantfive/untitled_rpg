extends Node

const JUMP_VELOCITY = 9.0
@onready var player = $".."
@export var rotation_speed : float = 8
@onready var mesh_root = $"../MeshRoot"
var direction : Vector3
var velocity : Vector3
var acceleration = 5.0
var speed = 8.0
var cam_rotation : float = 0
var player_init_rotation : float

func _ready():
	player_init_rotation = player.rotation.y

func _physics_process(delta):
	if Dialogic.current_timeline == null and player.hud.inv_open == false:
		if Input.is_action_just_pressed('jump') and player.is_on_floor():
			velocity.y = JUMP_VELOCITY
			
		if player.is_movement_ongoing():
			velocity.x = speed * direction.normalized().x
			velocity.z = speed * direction.normalized().z
		else:
			velocity.x = 0
			velocity.z = 0
			
		if not player.is_on_floor():
			velocity += player.get_gravity() * delta * 2
			
		player.velocity = player.velocity.lerp(velocity, acceleration * delta)
		player.velocity.y = velocity.y

		player.move_and_slide()
		
		var target_rotation = atan2(direction.x, direction.z) - player_init_rotation
		mesh_root.rotation.y = lerp_angle(mesh_root.rotation.y, target_rotation, rotation_speed * delta)
		$"../CollisionShape3D".rotation.y = mesh_root.rotation.y


func _on_player_set_movement_direction(_movement_direction):
	direction = _movement_direction.rotated(Vector3.UP, cam_rotation + player_init_rotation)


func _on_camroot_set_cam_rotation(_cam_rotation):
	cam_rotation = _cam_rotation
