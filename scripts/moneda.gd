extends Area2D

@onready var game_manager = %GameManager
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var sonido_moneda = $sonidoMoneda
@onready var collision_shape_2d = $CollisionShape2D



func _on_body_entered(body):
	game_manager.incrementa_un_punto()
	sonido_moneda.play()
	animated_sprite_2d.visible= false
	collision_shape_2d.call_deferred("set", "disabled", true)


func _on_sonido_moneda_finished():
	queue_free()
