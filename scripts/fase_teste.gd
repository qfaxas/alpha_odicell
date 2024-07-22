extends Node2D

@onready var tempo = $tempo

# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.comeco(7)
	
func _process(delta):
	Autoload.tempo_restante()
	 
