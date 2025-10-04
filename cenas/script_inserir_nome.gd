# script_inserir_nome.gd
extends Control

@onready var label_time = $VBoxContainer/LabelTime
@onready var name_input = $VBoxContainer/NameInput
@onready var save_button = $VBoxContainer/SaveButton

func _ready():
	# Mostra o tempo final formatado
	label_time.text = "Seu tempo: " + GameManager.format_time(GameManager.final_time)
	# Conecta o sinal do botão à função de salvar
	save_button.pressed.connect(_on_save_button_pressed)

func _on_save_button_pressed():
	var player_name = name_input.text
	
	# Garante que o nome não esteja vazio
	if player_name.strip_edges().is_empty():
		player_name = "Anônimo"
		
	# Chama a função do singleton para salvar
	GameManager.save_score(player_name, GameManager.final_time)
	
	# Envia o jogador para a tela de ranking
	get_tree().change_scene_to_file("res://cenas/cena_ranking.tscn")
