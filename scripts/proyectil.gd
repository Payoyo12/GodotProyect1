extends CharacterBody2D

var direccion:Vector2
var impulso:float

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = direccion*impulso
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
