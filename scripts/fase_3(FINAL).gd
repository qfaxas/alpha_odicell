extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicasESons.tocar_final()

func _exit_tree():
	MusicasESons.parar_final()
