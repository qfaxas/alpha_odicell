extends Area2D

@onready var intrans = $StaticBody2D
@onready var label = $Label
@onready var fechado = $fechada
@onready var aberto = $abert
@onready var luz = $StaticBody2D/CollisionShape2D


const PersonagemPrincipal = preload("res://scripts/personagem_principal.gd")

var dentro :bool = false

func _process(delta):
	if Input.is_action_just_pressed("interagir") and dentro:
			intrans.collision_layer = 0
			fechado.hide()
			aberto.show()
			PersonagemPrincipal.bateria -= 1
			luz.hide()

func _on_body_entered(body):
	if (body.name == "Personagem_principal"):
		label.show()
		dentro = true
		


func _on_body_exited(body):
	if (body.name == "Personagem_principal"):
		label.hide()
		dentro = false
