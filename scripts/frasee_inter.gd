extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file("res://cenas/fase_2.tscn")
