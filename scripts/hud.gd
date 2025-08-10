extends CanvasLayer
var itemlist = ["knife"]
var inv_open = false
@onready var inventory_button = $inventory_button
@onready var inventory_close = $inventory_close
@onready var inventory_box = $inventory_box

func additem(item):
	var new_item = Button.new()
	new_item.name = item
	new_item.text = item
	inventory_box.add_child(new_item)


func _on_inventory_button_pressed():
	inventory_button.hide()
	get_tree().call_group("inventory", "show")
	inv_open = true


func _on_close_pressed():
	inventory_button.show()
	get_tree().call_group("inventory", "hide")
	inv_open = false
