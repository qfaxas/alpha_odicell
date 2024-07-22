extends Control

func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true
	
func pausar():
	if Input.is_action_just_pressed("esc") and not get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()
		

func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	if Autoload.fase1:
		get_tree().change_scene_to_file("res://cenas/fase_1.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_back_2_menu_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_principal.tscn")

