extends Node

@onready var grelinho = $grelinho

func tocar_grelinho():
	grelinho.play()

func parar_grelinho():
	grelinho.stop()
