extends Area2D
# en este script hay fallos comentados con ##.

# Variables para nodos que se usarán en el script
@onready var timer = $Timer
@onready var sonido_muerte = $sonidoMuerte

# se ejecuta al colisionar con otro objeto
func _on_body_entered(body):
	
	# efectos que pasa si colisiona con el jugador
	if body.name == "jugador":
		# si tine mas de 1 de vida entra
		if	body.vida >1: # resta 1 de vida y actualiza la informacion
			body.decrementa_una_vida() 
		else: # si no tiene mas dde 1 de vida muere
			muerte_jugador(body)
	
	# efectos que pasa si colisiona con otro cuerpo
	else: 
		muerte_jugador(body)

# efectos que le ocurren al jugador al morir
func muerte_jugador(body):
	print("Perdiste") # muestra en consola
	sonido_muerte.play() # Reproduce el sonido de obtencion de pocion
	Engine.time_scale = 0.3 #el juego correrá a un 30% de su velocidad normal
	body.get_node("CollisionShape2D").queue_free() # destruye la colision del body
	timer.start() #inicia el temporizador

# se activa cuando un temporizador (Timer) llega a su tiempo de espera
func _on_timer_timeout():
	Engine.time_scale = 1 # reestableze la velocidad del juego a su escala normal
	get_tree().reload_current_scene() # Recarga la escena actual

