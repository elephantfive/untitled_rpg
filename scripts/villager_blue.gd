extends Area3D
var dialogue_allowed: bool = true
@onready var game_manager: Node = %GameManager
@onready var sprite_highlight = $Sprite3D2
@onready var sprite = $Sprite3D
@onready var player = %Player

func _ready():
	sprite_highlight.texture = sprite.texture
	sprite_highlight.scale = sprite.scale * 1.1
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == ('kill' + '.' + name):
		queue_free()
	
func _on_input_event(_camera, event, _event_position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Dialogic.current_timeline != null:
				return
			else:
				Dialogic.start(str(name))

func _on_mouse_entered():
	if dialogue_allowed:
		$Sprite3D2.show()

func _on_mouse_exited():
	if dialogue_allowed:
		$Sprite3D2.hide()
