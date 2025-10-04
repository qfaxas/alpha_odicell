# script_ranking.gd
extends Control

@onready var score_list_container = $VBoxContainer/ScoreListContainer
@onready var menu_button = $VBoxContainer/MenuButton

func _ready():
	menu_button.pressed.connect(_on_menu_button_pressed)
	populate_ranking()

func populate_ranking():
	# Limpa qualquer entrada antiga (caso a cena seja recarregada)
	for child in score_list_container.get_children():
		child.queue_free()

	var scores = GameManager.load_scores()

	if scores.is_empty():
		var label = Label.new()
		label.text = "Ainda não há recordes. Seja o primeiro!"
		score_list_container.add_child(label)
		return

	# Itera sobre os scores e cria um label para cada um
	for i in range(scores.size()):
		var entry = scores[i]
		var rank = i + 1
		var player_name = entry.name
		var formatted_time = GameManager.format_time(entry.time)
		
		var entry_label = Label.new()
		entry_label.text = "%d. %s - %s" % [rank, player_name, formatted_time]
		
		score_list_container.add_child(entry_label)

func _on_menu_button_pressed():
	# Mude para a sua cena de menu principal
	get_tree().change_scene_to_file("res://cenas/menu_principal.tscn")
