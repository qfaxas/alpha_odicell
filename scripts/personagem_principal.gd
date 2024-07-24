extends CharacterBody2D


const SPEED = 700.0
const JUMP_VELOCITY = -550.0
const Autoload = preload("res://scripts/autoload.gd")
@onready var sprite_2d = $Sprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


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
	
func morrer():
	get_tree().change_scene_to_file("res://cenas/menu_morte.tscn")
