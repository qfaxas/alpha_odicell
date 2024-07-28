extends Control

func _ready():
	$escolha.play()
	grab_focus()
	

func _on_volume_button_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_volume.tscn")


func _on_graphs_button_pressed():
	pass # Replace with function body.


func _on_control_remap_pressed():
	pass # Replace with function body.


func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_principal.tscn")
	
