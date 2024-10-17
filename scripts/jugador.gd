extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const PROYECTIL = preload("res://scenes/proyectil.tscn")

@onready var spawn_proyectil = $spawnProyectil
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var sonido_salto = $sonidoSalto


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sonido_salto.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left2", "ui_right2")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction <0:
		animated_sprite_2d.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump2")
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)



	if Input.is_action_just_pressed("disparo"):
		var newProyectil = PROYECTIL.instantiate()
		newProyectil.global_position = $spawnProyectil.global_position
		get_parent().add_child(newProyectil)



	move_and_slide()
