extends CharacterBody2D

# Constantes para la velocidad de movimiento y la velocidad de salto
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
# Carga la escena del proyectil para instanciarla más tarde
const PROYECTIL = preload("res://scenes/proyectil.tscn")

# Variables para nodos que se usarán en el script
@onready var spawn_proyectil = $spawnProyectil  # Nodo donde se generará el proyectil
@onready var animated_sprite_2d = $AnimatedSprite2D  # Nodo para el sprite animado del personaje
@onready var sonido_salto = $sonidoSalto  # Nodo para el sonido del salto

# Obtiene la gravedad del proyecto para sincronizarla con los nodos RigidBody
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Añade la gravedad si el personaje no está en el suelo
	if not is_on_floor():
		velocity.y += gravity * delta

	# Configuración de salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY  # Aplica la velocidad de salto
		sonido_salto.play()  # Reproduce el sonido de salto

	# Obtiene la dirección de entrada y maneja el movimiento/desaceleración
	var direction = Input.get_axis("ui_left2", "ui_right2")
	
	# Cambia la dirección del sprite según la dirección que toma el personaje
	if direction > 0:
		animated_sprite_2d.flip_h = false  # No voltear el sprite
	elif direction < 0:
		animated_sprite_2d.flip_h = true  # Voltear el sprite horizontalmente
	
	# Cambia la animación según la dirección del personaje
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")  # Animación de inactividad
		else:
			animated_sprite_2d.play("run")  # Animación de carrera
	else:
		animated_sprite_2d.play("jump2")  # Animación de salto
	
	# Controla el movimiento horizontal del personaje
	if direction:
		velocity.x = direction * SPEED  # Movimiento basado en la dirección de entrada
	else:
		# Desacelera el personaje cuando no hay entrada
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Instancia un proyectil si se presiona la tecla de disparo
	if Input.is_action_just_pressed("disparo"):
		var newProyectil = PROYECTIL.instantiate()  # Crea una nueva instancia del proyectil
		newProyectil.global_position = $spawnProyectil.global_position  # Posiciona el proyectil en el nodo de spawn
		get_parent().add_child(newProyectil)  # Añade el proyectil como hijo del nodo padre

	# Mueve al personaje usando la física
	move_and_slide()
