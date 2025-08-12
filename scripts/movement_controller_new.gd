extends Node

@onready var player = $".."
@export var rotation_speed : float = 8
@export var fall_gravity : float = 45
var jump_gravity : float = fall_gravity
var direction : Vector3
var velocity : Vector3
var acceleration = 5.0
var speed = 8.0
var cam_rotation : float = 0
var player_init_rotation : float
var jump_height = 3.0
var apex_duration = 0.5
@onready var mesh_root = $"../MeshRoot"


func _ready():
	player_init_rotation = player.rotation.y

func _physics_process(delta):
	if player.is_movement_ongoing():
		velocity.x = speed * direction.normalized().x
		velocity.z = speed * direction.normalized().z
	else:
		velocity.x = 0
		velocity.z = 0
	
	if not player.is_on_floor():
		if velocity.y >= 0:
			velocity.y -= jump_gravity * delta
		else:
			velocity.y -= fall_gravity * delta
	
	player.velocity = player.velocity.lerp(velocity, acceleration * delta)
	player.move_and_slide()
	
	var target_rotation = atan2(direction.x, direction.z) - player_init_rotation
	mesh_root.rotation.y = lerp_angle(mesh_root.rotation.y, target_rotation, rotation_speed * delta)
	
	



func _jump():
	velocity.y = 2 * jump_height / apex_duration
	jump_gravity = velocity.y / apex_duration


func _on_player_set_movement_direction(_movement_direction):
	direction = _movement_direction.rotated(Vector3.UP, cam_rotation + player_init_rotation)


func _on_camroot_set_cam_rotation(_cam_rotation):
	cam_rotation = _cam_rotation
