extends CharacterBody3D

@onready var hud = %HUD
@onready var camroot = %Camroot
signal set_movement_direction(_movement_direction: Vector3)

var movement_direction: Vector3

func _ready():
	set_movement_direction.emit(Vector3.FORWARD)

func _input(event):
	if event.is_action('movement'):
		movement_direction.x = Input.get_action_strength('right') - Input.get_action_strength('left')
		movement_direction.z = Input.get_action_strength('back') - Input.get_action_strength('forward')

func _physics_process(_delta):
	if is_movement_ongoing():
		set_movement_direction.emit(movement_direction)

func is_movement_ongoing() -> bool:
	return abs(movement_direction.x) > 0 or abs(movement_direction.z) > 0
