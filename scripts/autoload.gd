extends Node

@onready var energia = $Energia

var escuro = false

func _on_timer_timeout():
	escuro = true

func comeco(valor):
	energia.wait_time = valor
	energia.start()

func tempo_restante():
	print(int(energia.time_left))
	
