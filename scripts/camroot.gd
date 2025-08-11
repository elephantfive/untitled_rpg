extends Node3D


@export var player : CharacterBody3D
@onready var yaw_node = $CamYaw
@onready var pitch_node = $CamYaw/CamPitch
var yaw : float = 0
var pitch : float = 0
@onready var spring_arm_3d = $CamYaw/CamPitch/SpringArm3D

var yaw_sensitivity : float = 0.07
var pitch_sensitivity : float = 0.07

var yaw_acceleration : float = 30
var pitch_acceleration : float = 30

var pitch_max : float = 75
var pitch_min : float = -55

var tween : Tween

var position_offset : Vector3 = Vector3(0, 1.3, 0)
var position_offset_target : Vector3 = Vector3(0, 1.3, 0)


func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#top_level = true
	pass


func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		yaw += -event.relative.x * yaw_sensitivity
		pitch += event.relative.y * pitch_sensitivity


func _physics_process(_delta): 
	pitch = clamp(pitch, pitch_min, pitch_max)
	
	#yaw_node.rotation_degrees.y = lerp(yaw_node.rotation_degrees.y, yaw, yaw_acceleration * delta)
	#pitch_node.rotation_degrees.x = lerp(pitch_node.rotation_degrees.x, pitch, pitch_acceleration * delta)
	
	yaw_node.rotation_degrees.y = yaw
	pitch_node.rotation_degrees.x = pitch

func zoom():
	if Input.is_action_just_released('wheel_up') and position.z < 1.0:
		position.z += 0.25
		position.y += 0.25
		#spring_arm_3d.spring_length += 0.25
	if Input.is_action_just_released('wheel_down') and position.z > -0.5 and position.y > -0.5:
		#spring_arm_3d.spring_length -= 0.25
		position.z -= 0.25
		position.y -= 0.25
