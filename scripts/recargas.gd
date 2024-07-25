extends Node2D


func _on_body_entered(body):
	if (body.name == "Personagem_principal"):
		body.recarga()
		queue_free()
