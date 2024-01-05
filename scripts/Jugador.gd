extends Area2D

const Velocidad	 = 150
var Movimiento = Vector2()
var Touch = false
var P
var Longitud = 20
signal choque 

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed == true:
			Touch = true
			P = event.position
		else:
			Touch = false
func _ready():
	hide()
func _physics_process(delta):
	Movimiento = Vector2()
	if Touch:
		if abs(global_position.x - P.x) > Longitud:
			if global_position.x > P.x:
				Movimiento.x -=1
			else:
				Movimiento.x +=1
				
		if abs(global_position.y - P.y) > Longitud:
			if global_position.y > P.y:
				Movimiento.y -= 1
			else:
				Movimiento.y += 1
				
				
		if Movimiento.length() > 0:
			Movimiento = Movimiento.normalized() * Velocidad
		position += Movimiento * delta
		
		
func _on_body_entered(_body):
	hide()
	emit_signal("choque")
	$CollisionShape2D.set_deferred("disable", true)
	
func inicio(p):
	position = p
	show()
	$CollisionShape2D.disabled = false
	
	
	
	
