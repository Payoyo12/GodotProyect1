extends RigidBody2D

# Velocidad inicial del proyectil
const SPEED = 5.0

# Método que se llama al instanciar el proyectil
func _ready():
	# Aplica un impulso en diagonal
	apply_impulse(Vector2.ZERO, Vector2(SPEED, -SPEED))  # Ajusta los valores para la dirección deseada

# Opcional: puedes agregar lógica para destruir el proyectil después de un tiempo o al colisionar
func _process(delta):
	# Puedes añadir lógica aquí si es necesario, como detectar colisiones
	if position.y < -100:  # Ejemplo de destrucción fuera de pantalla
		queue_free()
