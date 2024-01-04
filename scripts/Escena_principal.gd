extends Node
@export var Bola : PackedScene
var Score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	

func _on_jugador_choque():
	$ScoreTimer.stop()
	$BolaTimer.stop()
	
func nuevo_juego():
	Score = 0
	$InicioTimer.start()
	$Jugador.inicio($PosicionInicial.Posicion)
	$AudioJugando.start()
	
func game_over():
	$ScoreTimer.stop()
	$BolaTimer.stop()
	$AudioGame_Over.start()
	$AudioJugando.stop()


func _on_inicio_timer_timeout():
	$BolaTimer.start()
	$ScoreTimer.start()


func _on_score_timer_timeout():
	Score += 1

func _on_bola_timer_timeout():
	$BolaCamino/BolaPosicion.set_offset(randi())
	var B = Bola.instance()
	add_child(B)
	var d = $BolaCamino/BolaPosicion.rotation + PI / 2
	B.position = $BolaCamino/BolaPosicion.position
	d += randf_range(-PI/4,PI/4)
	B.rotation = d
	
	
