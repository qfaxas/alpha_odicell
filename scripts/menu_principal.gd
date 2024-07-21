extends Control



func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://cenas/cena_2.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_opções.tscn")


func _on_credits_button_pressed():
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit()
