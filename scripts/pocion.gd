extends Area2D

@onready var game_manager = %GameManager
@onready var sonido_pocion = $sonidoPocion
@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D





func _on_body_entered(body):
	game_manager.incrementa_una_vida()
	sonido_pocion.play()
	sprite_2d.visible= false
	collision_shape_2d.call_deferred("set", "disabled", true)
	


func _on_sonido_pocion_finished():
	queue_free()
