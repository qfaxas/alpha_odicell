extends Area2D

@onready var timer = $Timer
@onready var personagem_principal = $"../Personagem_principal"


var escuro = true

func _on_body_entered(body):
	if (body.name == "Personagem_principal"):
		body.luz.hide()


func _on_timer_timeout():
	personagem_principal.luz.show()
