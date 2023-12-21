extends CharacterBody2D

const Velocidad	 = 500
var Movimiento = Vector2()
var Touch = false
var Posicion 

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed == true:
			Touch = true
			Posicion = event.position
		else:
			Touch = false
func _ready():
	pass
func _physics_process(delta):
	Movimiento = Vector2()
	if Touch:
		if global_position.x > Posicion.x:
			Movimiento.x -=1
		else:
			Movimiento.x +=1
	position += Movimiento
	
