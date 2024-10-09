extends Area2D

@onready var game_manager = %GameManager




func _on_body_entered(body):
	game_manager.incrementa_un_punto()
	queue_free()
