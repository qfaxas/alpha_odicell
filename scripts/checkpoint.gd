extends Area2D

func _on_body_entered(body):
	if (body.name == "Personagem_principal"):
		Autoload.ultimo_checkpoint = body.global_position
		body.recarga_total()
