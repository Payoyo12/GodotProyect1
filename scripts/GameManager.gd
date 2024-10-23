extends Node

#variables
var puntuacion= 0
var vida= 3

@onready var label_6 = $"../Textos/Label6"
@onready var resultado = $"../Textos/resultado"
@onready var vidas = $"../jugador/Camera2D/vidas"


func incrementa_un_punto():
	puntuacion += 1
	label_6.text = "Has conseguido\n"+str(puntuacion)+" monedas"
	resultado.text = "monedas "+str(puntuacion)+"/10\n calabazas 0/1"

func incrementa_una_vida():
	vida += 1
	vidas.text = "Vidas: "+ str(vida)
	
func decrementa_una_vida():
	vida = vida - 1
	vidas.text = "Vidas: "+ str(vida)
	
