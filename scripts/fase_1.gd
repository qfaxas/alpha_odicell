extends Node2D

@onready var tempo = $tempo
@onready var menu_pause = $CanvasLayer/menu_pause

# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.comeco(15)
	menu_pause.hide()
	
func _process(delta):
	Autoload.tempo_restante()

#Menu de pause
func _input(event):
	if Input.is_action_just_pressed("esc"):
		menu_pause.show()
		get_tree().paused = true
	 
