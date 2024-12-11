extends CharacterBody2D


@onready var playback: AnimationNodeStateMachinePlayback = $AnimationTree.get("parameters/playback")



func _ready() -> void:
	$AnimationPlayer.play("Idel")
	$AnimationPlayer.stop()
	

func _process(delta: float) -> void:
	state_machine() #lo pongo en el proces para que se reproduzca una vez cada frame


func state_machine():
	match playback.get_current_node():
		"Idel":
			print("el personaje esta detenido")
		"run":
			print("El personaje esta corriendo")
