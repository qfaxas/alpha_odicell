extends Control

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://cenas/fase_1.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_principal.tscn")
