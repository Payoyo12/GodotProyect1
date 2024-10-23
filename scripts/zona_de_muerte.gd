extends Area2D
# en este script hay fallos comentados con ##.

# Variables para nodos que se usarán en el script
@onready var timer = $Timer
@onready var sonido_muerte = $sonidoMuerte
@onready var game_manager = %GameManager

# se ejecuta al colisionar con otro objeto
func _on_body_entered(body):
		print("Perdiste") # muestra en consola
		##game_manager.decrementa_una_vida() 
		sonido_muerte.play() # Reproduce el sonido de obtencion de pocion
		Engine.time_scale = 0.3 #el juego correrá a un 30% de su velocidad normal
		body.get_node("CollisionShape2D").queue_free() # destruye la colision del body
		timer.start() #inicia el temporizador
	
	
	
# se activa cuando un temporizador (Timer) llega a su tiempo de espera
func _on_timer_timeout():
	Engine.time_scale = 1 # reestableze la velocidad del juego a su escala normal
	get_tree().reload_current_scene() # Recarga la escena actual
	##if game_manager.vida < 1: 
	##	get_tree().reload_current_scene() 
	##else:  
	##	print("return") 
