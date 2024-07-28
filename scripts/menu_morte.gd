extends Control

@onready var restart = $MarginContainer/VBoxContainer/restart
@onready var morte = $Morte
	

func _ready():
	restart.grab_focus()
	morte.play()

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://cenas/fase_1.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_opcoes.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_principal.tscn")
