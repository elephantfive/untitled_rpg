extends CanvasLayer
var itemlist = {
	"knife": {
		'title': 'Rusty Dagger',
		'type': 'Weapon', 
		'desc': 'Useful for cutting things and procuring entrails.',
		'texture': 'res://assets/images/knife.png',
		},
	"hilgrum_entrails": {
		'title': 'Hilgrum\'s Entrails',
		'type': 'Biological Material',
		'desc': 'Entrails taken from a villager',
		'texture': 'res://assets/images/yellow_entrails.png',
	},
	"fool_entrails": {
		'title': 'Incandescent Fool\'s Entrails',
		'type': 'Biological Material',
		'desc': 'Entrails taken from a villager',
		'texture': 'res://assets/images/fool_entrails.png',
	},
}

var inv_open = false
@onready var inventory_box = %InventoryBox
@onready var item_desc = %ItemDesc
const ITEM = preload("res://main/items/item.tscn")

func additem(item):
	var new_item = ITEM.instantiate()
	new_item.title = itemlist[item]['title']
	new_item.type = itemlist[item]['type']
	new_item.desc = itemlist[item]['desc']
	new_item.texture = itemlist[item]['texture']
	new_item.hud = self
	inventory_box.add_child(new_item)


func _input(event):
	if event.is_action_pressed('inventory'):
		if inv_open:
			inv_close()
		else:
			get_tree().call_group("inventory", "show")
			inv_open = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_close_pressed():
	inv_close()
	
func inv_close():
	item_desc.hide()
	get_tree().call_group("inventory", "hide")
	inv_open = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
