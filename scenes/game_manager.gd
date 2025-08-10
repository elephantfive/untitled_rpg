extends Node
@onready var player = %Player
@onready var player_black_box = %PlayerBlackBox
@onready var hud = %HUD

func _ready():
	#Dialogic.start('game_start')
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument in hud.itemlist:
		hud.additem(argument)
	
func pause(scene):
	scene.set_deferred("process_mode", PROCESS_MODE_DISABLED)

func unpause(scene):
	scene.set_deferred("process_mode", PROCESS_MODE_INHERIT)
