extends CanvasLayer
signal Nuevo_Juego
var P = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Instrucciones.hide()
	$BotonVolver.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()


func _on_mensaje_timer_timeout():
	$Mensaje.hide()
	
func Score(Score):
	$Score.text = str(Score)
	$Score.show()
	
func Game_Over():
	P = true
	
	
