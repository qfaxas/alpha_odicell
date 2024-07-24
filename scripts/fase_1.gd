extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.comeco(120)
	
func _process(delta):
	Autoload.tempo_restante()
