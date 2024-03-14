extends Node
#var Bola = load("res://scenes/Enemigo.tscn").instantiate()
var Bola = load("res://scenes/Enemigo.tscn")

#var Bola = Scene.Enemigo()
var Score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$BolaCamino/BolaPosicion.set_progress(randi() )
	var B = Bola.instantiate()
	add_child(B)
	var d = $BolaCamino/BolaPosicion.rotation + PI / 2
	B.position = $BolaCamino/BolaPosicion.position
	d += randf_range(-PI/4,PI/4)
	B.rotation = d
	B.set_linear_velocity(Vector2(randf_range(B.VelocidadMin,B.VelocidadMax), 0).rotated(d))
	
	

func _on_jugador_choque():
	$ScoreTimer.stop()
	$BolaTimer.stop()
	
func nuevo_juego():
	Score = 0
	$InicioTimer.start()
	$Jugador.inicio($PosicionInicial.position)
	$AudioJugando.play()
	$Interfaz.Score(Score)
	
func game_over():
	$ScoreTimer.stop()
	$BolaTimer.stop()
	$AudioGame_Over.play()
	$AudioJugando.stop()
	$Interfaz.Game_Over()


func _on_inicio_timer_timeout():
	$BolaTimer.start()
	$ScoreTimer.start()


func _on_score_timer_timeout():
	Score += 1
	$Interfaz.Score(Score)

#func _on_bola_timer_timeout():
#	$BolaCamino/BolaPosicion.set_progress(randi() )
	#var B = Bola.instantiate()
	#add_child(B)
#	var d = $BolaCamino/BolaPosicion.rotation + PI / 2
#	B.position = $BolaCamino/BolaPosicion.position
#	d += randf_range(-PI/4,PI/4)
#	B.rotation = d
#	B.set_linear_velocity(Vector2(randf_range(B.VelocidadMin,B.VelocidadMax), 0).rotated(d))
	
	
	
