extends Node2D

@onready var tempo = $tempo

# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.comeco(3)
	
func _process(delta):
	tempo.text = str(Autoload.tempo_restante)
