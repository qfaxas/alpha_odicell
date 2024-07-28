extends Area2D

@onready var timer = $Timer
@onready var personagem_principal = $"../Personagem_principal"
@onready var canvas_modulate = $"../CanvasModulate"

func _on_body_entered(body):
	if (body.name == "Personagem_principal"):
		body.luz.hide()
		canvas_modulate.hide()
		timer.start()
		$ai.play()

		personagem_principal.bateria -= 1


func _on_timer_timeout():
	personagem_principal.luz.show()
	canvas_modulate.show()
	
