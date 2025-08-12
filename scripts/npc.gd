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
	
func _input(event):
	if event.is_action('interact'):
		if distance_check():
			if Dialogic.current_timeline != null:
				return
			else:
				Dialogic.start(str(name))

func _process(_delta):
	if distance_check():
		sprite.modulate = Color(0.7, 0.7, 1, 0.9)
	else:
		sprite.modulate = Color(1, 1, 1, 1)

func distance_check():
	if player.position.x <= position.x + 5 and player.position.x >= position.x - 5:
		if player.position.z <= position.z + 5 and player.position.z >= position.z - 5:
			return true
