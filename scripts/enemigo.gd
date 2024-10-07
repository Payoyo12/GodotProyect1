extends Node2D

const VELOCIDAD = 60

var DIRECCION = 1

@onready var ray_cast_derecha = $RayCastDerecha
@onready var ray_cast_izquierda = $RayCastIzquierda
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if ray_cast_derecha.is_colliding():
		DIRECCION = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_izquierda.is_colliding():
		DIRECCION = 1
		animated_sprite_2d.flip_h = false
	
	position.x += DIRECCION * VELOCIDAD * delta
