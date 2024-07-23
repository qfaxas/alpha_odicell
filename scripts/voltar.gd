extends Button

func _ready():
	grab_focus()

func _on_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_principal.tscn")
