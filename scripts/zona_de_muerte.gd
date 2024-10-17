extends Area2D

@onready var timer = $Timer
@onready var sonido_muerte = $sonidoMuerte
@onready var game_manager = %GameManager


func _on_body_entered(body):
		print("Perdiste")
		game_manager.decrementa_una_vida() ##esto falla
		sonido_muerte.play()
		Engine.time_scale = 0.3
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
	
	
	

func _on_timer_timeout():
	Engine.time_scale = 1
	if game_manager.vida < 1:
		get_tree().reload_current_scene()
	else:
		print("return")
