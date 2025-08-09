extends Area2D
@onready var sprite = $Sprite2D
@onready var options_dictionary = %PlayerStartOptions
var dialogue_allowed = true
@onready var game_manager: Node = %GameManager

func _ready():
	game_manager.begin_dialogue($".")

func _process(_delta):
	%BlackScreenStart.queue_free()
	queue_free()
