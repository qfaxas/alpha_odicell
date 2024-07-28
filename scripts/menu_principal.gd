extends Control


func _ready():
	get_viewport().size = DisplayServer.screen_get_size()
	$escolha.play()

func _on_play_button_pressed():
	Autoload.ultimo_checkpoint = null
	get_tree().change_scene_to_file("res://cenas/menu_fases.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_opcoes.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://cenas/creditos.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
