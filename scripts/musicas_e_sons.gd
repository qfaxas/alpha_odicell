extends Node

@onready var grelinho = $grelinho
@onready var musicafundo = $musicafundo
@onready var creditos = $creditos

func tocar_grelinho():
	grelinho.play()

func parar_grelinho():
	grelinho.stop()

func tocar_musica():
	musicafundo.play()

func parar_musica():
	musicafundo.stop()

func tocar_creditos():
	creditos.play()
	
func parar_creditos():
	creditos.stop()
