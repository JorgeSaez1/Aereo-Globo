extends CharacterBody2D

const Velocidad	 = 150
var Movimiento = Vector2()
var Touch = false
var Posicion
var Longitud = 20 

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
		if abs(global_position.x - Posicion.x) > Longitud:
			if global_position.x > Posicion.x:
				Movimiento.x -=1
			else:
				Movimiento.x +=1
				
		if abs(global_position.y - Posicion.y) > Longitud:
			if global_position.y > Posicion.y:
				Movimiento.y -= 1
			else:
				Movimiento.y += 1
				
				
		if Movimiento.length() > 0:
			Movimiento = Movimiento.normalized() * Velocidad
		position += Movimiento * delta
		
		
		
		
		
		
		
		
		
	
