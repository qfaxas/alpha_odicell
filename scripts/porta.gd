extends Area2D

@onready var intrans = $intrans
@onready var label = $Label
@onready var fechado = $fechado
@onready var aberto = $aberto

const PersonagemPrincipal = preload("res://scripts/personagem_principal.gd")

var dentro :bool = false

func _process(delta):
	if Input.is_action_just_pressed("interagir") and dentro:
			intrans.collision_layer = 0
			fechado.hide()
			aberto.show()
			PersonagemPrincipal.bateria -= 1

func _on_body_entered(body):
	if (body.name == "Personagem_principal"):
		label.show()
		dentro = true
		


func _on_body_exited(body):
	if (body.name == "Personagem_principal"):
		label.hide()
		dentro = false
