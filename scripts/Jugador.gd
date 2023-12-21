extends CharacterBody2D

const Velocidad	 = 300.0
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
	
	pass
	
