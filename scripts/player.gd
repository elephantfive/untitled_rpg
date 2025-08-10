extends CharacterBody2D
var speed = 200
var health = 10
@onready var sprite_2d = $Sprite2D
var move_direction = Vector2(0, 0)
@onready var hud = %HUD


	
func _physics_process(_delta):
	if hud.inv_open == false and Dialogic.current_timeline == null:
		move_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = move_direction * speed
		move_and_slide()

func _input(event):  
	if event.is_action_pressed("inventory"):
		pass
		
	if event.is_action_pressed("esc"):
		pass
