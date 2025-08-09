extends Area2D
var dialogue_allowed: bool = true
@onready var game_manager: Node = %GameManager
@onready var sprite_highlight = $Sprite2D2
@onready var sprite_2d = $Sprite2D
@onready var player = %Player

func _ready():
	sprite_highlight.texture = sprite_2d.texture
	sprite_highlight.scale = sprite_2d.scale * 1.1

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Dialogic.current_timeline != null:
				return
			else:
				game_manager.pause(player)
				Dialogic.start(str(name))

func _on_mouse_entered():
	if dialogue_allowed:
		$Sprite2D2.show()

func _on_mouse_exited():
	if dialogue_allowed:
		$Sprite2D2.hide()
