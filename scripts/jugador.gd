extends CharacterBody2D
# variables
var puntuacion = 0

# variables para diseñador
@export var SPEED = 130
@export var JUMP_VELOCITY = 300
@export var vida = 3

# Variables para nodos
@onready var animated_sprite_2d = $AnimatedSprite2D  # Nodo para el sprite animado del personaje
@onready var sonido_salto = $sonidoSalto  # Nodo para el sonido del salto

# variables para scenas
const PROYECTIL = preload("res://scenes/proyectil.tscn")

# Obtiene la gravedad del proyecto para sincronizarla con los nodos RigidBody
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#apartado de fisicas
func _physics_process(delta):
	
	# Añade la gravedad si el personaje no está en el suelo
	if not is_on_floor():
		velocity.y += gravity * delta

	# Configuración de salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -JUMP_VELOCITY  # Aplica la velocidad de salto
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

	# si se presiona la tecla de disparo se lanza un proyectil
	if Input.is_action_just_pressed("disparo"):
		
		lanzamiento_proyectil() # se encarga del lanzamiento
		
	# Mueve al personaje usando la física
	move_and_slide()

# incrementa el valos de la variable vida
func incrementa_una_vida():
	vida += 1
	print("vida: " + str(vida))

# decrementa el valos de la variable vida
func decrementa_una_vida():
	vida -= 1
	print("vida: " + str(vida))

# incrementa el valos de la variable puntuacion
func incrementa_puntuacion():
	puntuacion += 1
	print("puntuacion: " + str(puntuacion))

# funcionencargada de lanzar el proyectil
func lanzamiento_proyectil():
	var newProyectil = PROYECTIL.instantiate()  # Crea una nueva instancia del proyectil
	
	# segun donde mira el personaje se lanzara el proyectil desde la posicion correcta
	if	!animated_sprite_2d.flip_h:
		newProyectil.global_position = global_position + Vector2(10, -20)  # Posiciona el proyectil en la posicion del jugador + correccion de distancia
		newProyectil.direction = 1
	elif animated_sprite_2d.flip_h:
		newProyectil.global_position = global_position + Vector2(-10, -20)  # Posiciona el proyectil en la posicion del jugador + correccion de distancia
		newProyectil.direction = -1
		
	get_parent().add_child(newProyectil)  # Añade el proyectil como hijo del nodo padre
