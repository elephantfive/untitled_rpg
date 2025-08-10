extends CanvasLayer
var itemlist = {
	"knife": {
		'type': 'Weapon', 
		'desc': 'Useful for cutting things and procuring entrails.',
		'texture': 'res://assets/images/knife.png'
		},
	
}

var inv_open = false
@onready var inventory_button = $inventory_button
@onready var inventory_box = %inventory_box
@onready var item_desc = %item_desc
const ITEM = preload("res://main/items/item.tscn")

func additem(item):
	var new_item = ITEM.instantiate()
	new_item.name = item
	new_item.text = item
	new_item.type = itemlist[item]['type']
	new_item.desc = itemlist[item]['desc']
	new_item.texture = itemlist[item]['texture']
	new_item.hud = self
	inventory_box.add_child(new_item)


func _on_inventory_button_pressed():
	inventory_button.hide()
	get_tree().call_group("inventory", "show")
	inv_open = true


func _on_close_pressed():
	inventory_button.show()
	item_desc.hide()
	get_tree().call_group("inventory", "hide")
	inv_open = false
