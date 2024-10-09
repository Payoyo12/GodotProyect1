extends Node

var puntuacion= 0

@onready var label_6 = $"../Textos/Label6"
@onready var resultado = $"../Textos/resultado"



func incrementa_un_punto():
	puntuacion += 1
	label_6.text = "Has conseguido\n"+str(puntuacion)+" monedas"
	resultado.text = "monedas "+str(puntuacion)+"/10\n calabazas 0/1"
