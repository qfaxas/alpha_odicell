extends CharacterBody2D


const SPEED = 700.0
const JUMP_VELOCITY = -550.0
@onready var sprite_2d = $Sprite2D
@onready var bateria_atual = $CanvasLayer/bateria_atual
@onready var energia = $energia
@onready var luz = $PointLight2D

static var bateria :int = 4


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	energia.start()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "fall"

	#animações
	if (velocity.x != 0):
		sprite_2d.animation = "Run"
	else:
		sprite_2d.animation = "Idle"
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Pulo.play()

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			$Passo.play()
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
		bateria_atual.texture = ResourceLoader.load("res://assets/arte/bateria_cheia.png")
		luz.texture_scale = 1.5
	
	elif (bateria == 3):
		bateria_atual.texture = ResourceLoader.load("res://assets/arte/bateria_75.png")
		luz.texture_scale = 1.25
	
	elif (bateria == 2):
		bateria_atual.texture = ResourceLoader.load("res://assets/arte/bateria_50.png")
		luz.texture_scale = 1
		
	elif (bateria == 1):
		bateria_atual.texture = ResourceLoader.load("res://assets/arte/bateria_25.png")
		luz.texture_scale = 0.75
	
	if (bateria == 0):
		morrer()
		bateria = 4
		

static func recarga():
	bateria += 1

func morrer():
	get_tree().change_scene_to_file("res://cenas/menu_morte.tscn")


func _on_energia_timeout():
	bateria -= 1
	energia.start()
