extends Control
var itemlist = ["knife"]
@onready var grid_container = $GridContainer

func additem(item):
	var new_item = Button.new()
	new_item.name = item
	new_item.text = item
	grid_container.add_child(new_item)
