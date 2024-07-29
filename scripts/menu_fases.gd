extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$escolha.play()

func _on_button_pressed():
	Autoload.ultimo_checkpoint = null
	get_tree().change_scene_to_file("res://cenas/frase_1.tscn")
	

func _on_button_2_pressed():
	if Autoload.fase2:
		Autoload.ultimo_checkpoint = null
		get_tree().change_scene_to_file("res://cenas/fase_2.tscn")
	else:
		$blok.play()


func _on_b_2_pressed():
	get_tree().change_scene_to_file("res://cenas/menu_principal.tscn")
