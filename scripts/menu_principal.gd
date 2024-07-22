extends Control



func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://cenas/fases/fase_1.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://cenas/menus/menu_opcoes.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://cenas/menus/creditos.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
