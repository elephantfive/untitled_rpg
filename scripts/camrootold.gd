extends Node3D

@onready var yaw_node = $CamYaw
@onready var pitch_node = $CamYaw/CamPitch
var yaw : float = 0
var pitch : float = 0
@onready var spring_arm_3d = $CamYaw/CamPitch/SpringArm3D
@onready var player = $".."

var yaw_sensitivity : float = 0.07
var pitch_sensitivity : float = 0.07

var yaw_acceleration : float = 30
var pitch_acceleration : float = 30

var pitch_max : float = 75
var pitch_min : float = -55

func _input(event):
	if event is InputEventMouseMotion and (Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE) or Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT)):
		yaw += -event.relative.x * yaw_sensitivity
		pitch += event.relative.y * pitch_sensitivity


func _physics_process(_delta): 
	pitch = clamp(pitch, pitch_min, pitch_max)
	
	yaw_node.rotation_degrees.y = yaw
	pitch_node.rotation_degrees.x = pitch

func zoom():
	if Input.is_action_just_released('wheel_up') and position.z < 1.0:
		position.z += 0.25
		position.y += 0.25
	if Input.is_action_just_released('wheel_down') and position.z > -0.5 and position.y > -0.5:
		position.z -= 0.25
		position.y -= 0.25
