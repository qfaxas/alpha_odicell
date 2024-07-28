extends Node

@onready var grelinho = $grelinho
@onready var musicafundo = $musicafundo
@onready var creditos = $creditos
@onready var final = $final

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

func tocar_final():
	final.play()
	
func parar_final():
	final.stop()
