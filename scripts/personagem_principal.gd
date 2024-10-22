extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -800.0
@onready var sprite_2d = $Sprite2D
@onready var bateria_atual = $CanvasLayer/bateria_atual
@onready var energia = $energia
@onready var luz = $PointLight2D
@onready var tempo_morte = $tempo_morte
@onready var pulo = $Pulo
@onready var passo = $Passo
@onready var morte = $Morte
@onready var insan = $insan


static var bateria :int = 4
var jump_buffer = 0.1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var QUEDA = gravity * 1.7

func _enter_tree():
	get_node("Sprite2D").show()
	recarga_total()

func _ready():
	energia.start()
	
func cair(velocity: Vector2):
	if velocity.y < 0:
		return gravity
	return QUEDA

func _physics_process(delta):
	#animações
	if (velocity.x != 0) and is_on_floor():
		sprite_2d.animation = "Run"
	else:
		sprite_2d.animation = "Idle"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += cair(velocity) * delta
		sprite_2d.animation = "Fall"

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		jump_buffer = 0.1
		pulo.play()
	jump_buffer -= delta
	if (jump_buffer > 0) and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4
		
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor() and not passo.is_playing():
			passo.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)		
	#vira o personagem
	var esquerda = velocity.x < 0
	sprite_2d.flip_h = esquerda
	if Input.is_action_just_pressed("left"):
		sprite_2d.flip_h = true
	if Input.is_action_just_pressed("right"):
		sprite_2d.flip_h = false
	

	move_and_slide()
	
	#checa o status da bateira
	if (bateria == 4):
		bateria_atual.animation = "cheio"
		luz.texture_scale = 1.5
		insan.hide()
		
	
	elif (bateria == 3):
		bateria_atual.animation = "75"
		luz.texture_scale = 1.25
		insan.hide()
	
	elif (bateria == 2):
		bateria_atual.animation = "50"
		luz.texture_scale = 1
		insan.hide()
		
	elif (bateria == 1):
		bateria_atual.animation = "25"
		luz.texture_scale = 0.75
		insan.show()
	
	if (bateria == 0):
		morrer()
		

func recarga():
	if bateria <= 3:
		bateria += 1
	energia.start()
	
func recarga_total():
	bateria = 4
	
func morrer():
	bateria = 4
	get_tree().change_scene_to_file("res://cenas/menu_morte.tscn")
	

func _on_energia_timeout():
	bateria -= 1
	energia.start()




func _on_fim_body_entered(body):
	if body.name == "Personagem_principal":
		get_tree().change_scene_to_file("res://cenas/frasefim.tscn")
