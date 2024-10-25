extends CanvasLayer


# Ruta de la escena del juego
var escena1 = "res://scenes/scene01.tscn"
var escena2 = "res://scenes/scene_02.tscn"



func _on_escena_1_pressed():
	get_tree().change_scene_to_file(escena1)


func _on_escena_2_pressed():
	get_tree().change_scene_to_file(escena2)


func _on_exit_pressed():
	get_tree().quit()
