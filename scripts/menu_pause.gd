extends Control

@onready var menu_pause = $"."
@onready var resume_button = $MarginContainer/VBoxContainer/resume_button	

func resume():
	get_tree().paused = false
	menu_pause.hide()
	
func pause():
	resume_button.grab_focus()
	get_tree().paused = true
	menu_pause.show()
	
func pausar():
	if Input.is_action_just_pressed("esc") and not get_tree().paused:
		pause()
		
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()
		

func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()
	


func _on_options_pressed():
	pass # Replace with function body.


func _on_back_2_menu_pressed():
	resume()
	get_tree().change_scene_to_file("res://cenas/menu_principal.tscn")

func _process(delta):
	pausar()
