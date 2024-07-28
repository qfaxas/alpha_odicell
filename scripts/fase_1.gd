extends Node2D

@onready var personagem_principal = $Personagem_principal

# Called when the node enters the scene tree for the first time.
func _ready():
	personagem_principal.bateria = 4
	get_viewport().size = DisplayServer.screen_get_size()
	MusicasESons.parar_creditos()
	MusicasESons.tocar_musica()
	MusicasESons.tocar_grelinho()

	
func _enter_tree():
	if Autoload.ultimo_checkpoint:
		$Personagem_principal.global_position = Autoload.ultimo_checkpoint

func _on_borda_body_entered(body):
	if (body.name == "Personagem_principal"):
		get_tree().change_scene_to_file("res://cenas/menu_morte.tscn")


func _on_deadzone_body_entered(body):
	if (body.name == "Personagem_principal"):
		get_tree().change_scene_to_file("res://cenas/menu_morte.tscn")

func _exit_tree():
	MusicasESons.parar_grelinho()
