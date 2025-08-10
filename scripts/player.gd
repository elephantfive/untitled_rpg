extends CharacterBody2D
var speed = 200
var health = 10
@onready var sprite_2d = $Sprite2D
var move_direction = Vector2(0, 0)
@onready var hud = %HUD
@onready var camera_2d = $Camera2D


	
func _physics_process(_delta):
	if hud.inv_open == false and Dialogic.current_timeline == null:
		move_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = move_direction * speed
		move_and_slide()
		zoom()

func _input(event):  
	if event.is_action_pressed("inventory"):
		pass
		
	if event.is_action_pressed("esc"):
		pass
		
func zoom():
	if Input.is_action_just_released('wheel_up') and $Camera2D.zoom.x < 2.0:
		$Camera2D.zoom.x += 0.25
		$Camera2D.zoom.y += 0.25
	if Input.is_action_just_released('wheel_down') and $Camera2D.zoom.x > 1 and $Camera2D.zoom.y > 1:
		$Camera2D.zoom.x -= 0.25
		$Camera2D.zoom.y -= 0.25
