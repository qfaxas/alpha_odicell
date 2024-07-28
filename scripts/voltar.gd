extends Button

@onready var escolha = $"../../../escolha"

var voltar = false

func _ready():
	grab_focus()

func _on_pressed():
	escolha.play()
	voltar = true

func _on_escolha_finished():
	if voltar:
		get_tree().change_scene_to_file("res://cenas/menu_principal.tscn")
