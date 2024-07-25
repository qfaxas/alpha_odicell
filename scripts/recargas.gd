extends Node2D

const PersonagemPrincipal = preload("res://scripts/personagem_principal.gd")

func _on_body_entered(body):
	if (body.name == "Personagem_principal"):
		get_tree().personagem_principal.recarga()
