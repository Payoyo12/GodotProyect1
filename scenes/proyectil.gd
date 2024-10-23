extends RigidBody2D

var SPEED = 10000
@onready var jugador = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	var direccion = (jugador.position - global_position).normalized()
	
	apply_central_impulse(direccion * SPEED)
	apply_central_force(direccion * SPEED)
	
	# apply_impulse(Vector2.ZERO, direccion * SPEED)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
