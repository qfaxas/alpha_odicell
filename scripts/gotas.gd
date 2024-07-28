extends Area2D


func _on_body_entered(body):
	if (body.name == "Personagem_principal"):
		body.bateria -= 1
		$"../awa".play()
		queue_free()
