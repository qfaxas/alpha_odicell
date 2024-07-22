extends Control


func _on_resume_pressed():
	pass # Replace with function body.


func _on_restart_pressed():
	if Autoload.fase1:
		get_tree().change_scene_to_file("res://cenas/fase_1.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_back_2_menu_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_principal.tscn")

