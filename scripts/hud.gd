extends Control
@onready var inventory = %Inventory
var inv_open = false

func _on_inventory_button_pressed():
	inventory.show()
	inv_open = true
	self.hide()


func _on_close_pressed():
	inventory.hide()
	inv_open = false
	self.show()
