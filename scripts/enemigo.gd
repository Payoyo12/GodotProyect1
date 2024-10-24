extends Node2D

#variables
var DIRECCION = 1

# variables para diseñador
@export var VELOCIDAD = 60

# Variables para nodos que se usarán en el script
@onready var ray_cast_derecha = $RayCastDerecha
@onready var ray_cast_izquierda = $RayCastIzquierda
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var game_manager = %GameManager


# Se llama cuando el nodo ingresa al árbol de escena por primera vez.
func _ready():
	pass # Reemplazar con el cuerpo de la función.

# Se llama cada cuadro. 'delta' es el tiempo transcurrido desde el cuadro anterior.
func _process(delta):
	
	# cambia direccion y sprite cuando vaya a colisionar usando raycast
	if ray_cast_derecha.is_colliding():
		DIRECCION = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_izquierda.is_colliding():
		DIRECCION = 1
		animated_sprite_2d.flip_h = false
	
	# mueve al personaje
	position.x += DIRECCION * VELOCIDAD * delta


