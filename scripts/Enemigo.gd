extends RigidBody2D

var VelocidadMin = 150
var VelocidadMax = 250
var TipoBola = ["BolaG","BolaP"]


func _ready():
	$AnimatedSprite2D.animation = TipoBola [randi () % TipoBola.size()]
	if $AnimatedSprite2D.animation == "BolaG":
		$CollisionShape2D.scale.x = 1.8
		$CollisionShape2D.scale.y = 1.8


func _on_visibilidad_screen_exited():
	queue_free()
