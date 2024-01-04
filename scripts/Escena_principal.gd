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
	
func game_over():
	$ScoreTimer.stop()
	$BolaTimer.stop()
