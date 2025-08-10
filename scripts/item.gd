extends Button

@export var sprite_texture: String
var desc: String
@onready var sprite = $Sprite2D

func _ready():
	sprite.texture = sprite_texture
	text = name
