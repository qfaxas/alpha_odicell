extends Area2D




func _on_body_entered(body):
	if (body.name == "Personagem_principal"):
		get_tree().change_scene_to_file("res://cenas/fase_2.tscn")
