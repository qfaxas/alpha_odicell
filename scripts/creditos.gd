extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$escolha.play()
	MusicasESons.parar_musica()
	MusicasESons.tocar_creditos()

func _exit_tree():
	MusicasESons.parar_creditos()
	MusicasESons.parar_final()

