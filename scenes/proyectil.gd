extends RigidBody2D

var SPEED = 100
@onready var jugador = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	var direccion = (jugador.position - global_position).normalized()
	direccion = Vector2(1,-1)
	apply_central_impulse(direccion * SPEED) #la direccion tiene que ser vector 2
	
	# apply_impulse(Vector2.ZERO, direccion * SPEED)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
