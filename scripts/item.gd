extends Button

var texture: String
var title: String
var desc: String
var type: String
var hud: CanvasLayer

func _ready():
	text = title


func _on_pressed():
	if hud.item_desc.visible == false or hud.item_desc.item_name.text != title:
		hud.item_desc.item_name.text = title
		hud.item_desc.item_texture.texture = load(texture)
		hud.item_desc.item_type.text = type
		hud.item_desc.item_desc.text = desc
		hud.item_desc.show()
	else:
		hud.item_desc.hide()
