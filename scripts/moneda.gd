extends Area2D

# Variables para nodos que se usarán en el script
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var sonido_moneda = $sonidoMoneda
@onready var collision_shape_2d = $CollisionShape2D

# se ejecuta al colisionar con otro objeto
func _on_body_entered(body):
	if	body.name == "jugador":
		body.incrementa_numMonedas() # actualiza la puntuacion
		sonido_moneda.play() # Reproduce el sonido de obtencion de moneda
		animated_sprite_2d.visible= false # se deja de visualizar la moneda
		collision_shape_2d.call_deferred("set", "disabled", true) # desactiva la colision de manera segura al finalizar el fotograma actual.
	else:
		pass

# se ejecuta cuando finaliza el sonido de la moneda
func _on_sonido_moneda_finished():
	queue_free() # Destruye la moneda
