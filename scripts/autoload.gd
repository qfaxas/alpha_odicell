extends Node

@onready var energia = $Energia

var tempo_restante = energia.get_time_left

var escuro = false

func _on_timer_timeout():
	escuro = true

func comeco(valor):
	energia.wait_time = valor
	energia.start()
