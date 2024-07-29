extends Area2D




func _on_body_entered(body):
	if (body.name == "Personagem_principal") and not Autoload.fase2:
		Autoload.ultimo_checkpoint = null
		Autoload.fase2 = true
		get_tree().change_scene_to_file("res://cenas/menu_fases.tscn")
	else:
		get_tree().change_scene_to_file("res://cenas/fase_3(FINAL).tscn")
