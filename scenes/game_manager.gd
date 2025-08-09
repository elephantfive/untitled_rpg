extends Node
@onready var player = %Player
@onready var player_black_box = %PlayerBlackBox
@onready var inventory = %Inventory

func _ready():
	#Dialogic.start('game_start')
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "player_pause":
		pause(player)
		#player_black_box.visible = true
	elif argument == "player_unpause":
		unpause(player)
		#player_black_box.visible = false
	elif argument == "add_knife":
		inventory.additem("knife")
	
func pause(scene):
	scene.set_deferred("process_mode", PROCESS_MODE_DISABLED)

func unpause(scene):
	scene.set_deferred("process_mode", PROCESS_MODE_INHERIT)
