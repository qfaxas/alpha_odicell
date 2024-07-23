extends Node

@onready var energia = $Energia

var fase1 = true
var fase2 = false
var fase3 = false


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://cenas/menu_morte.tscn")

func comeco(valor):
	energia.wait_time = valor
	energia.start()

func tempo_restante():
	print(int(energia.time_left))
	

