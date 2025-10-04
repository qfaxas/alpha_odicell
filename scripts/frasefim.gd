extends Control



func _process(delta):
	if Input.is_action_just_pressed("jump"):
		GameManager.stop_timer()
		get_tree().change_scene_to_file("res://cenas/cena_inserir_nome.tscn")
