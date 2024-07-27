extends Area2D

@onready var timer = $Timer
const PERSONAGEM_PRINCIPAL = preload("res://cenas/personagem_principal.tscn")
const PersonagemPrincipal = preload("res://scripts/personagem_principal.gd")

var escuro = true

func _on_body_entered(body):
	if (body.name == "Personagem_principal"):
		body.luz.hide()


func _on_timer_timeout():
	PersonagemPrincipal.luz.show()
