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
	Mensaje("Game Over")
	await get_tree().create_timer(3).timeout
	$Fondo.show()
	$BotonPlay.show()
	$BotonIns.show()
	$BotonQuit.show()
	$Score.hide()
	
func _on_boton_play_pressed():
	if P:
		P = false
		await get_tree().create_timer(1).timeout
		emit_signal("Nuevo_Juego")
		$Fondo.hide()
		$BotonPlay.hide()
		$BotonIns.hide()
		$BotonQuit.hide()
		Mensaje("Ready")


func _on_boton_quit_pressed():
	await get_tree().create_timer(1).timeout
	get_tree().quit()
	
	
func _on_boton_ins_pressed():
	await get_tree().create_timer(1).timeout
	$BotonPlay.hide()
	$BotonQuit.hide()
	$BotonIns.hide()
	$Instrucciones.show()
	$BotonVolver.show()
	$Fondo.hide()
	
func _on_boton_volver_pressed():
	await get_tree().create_timer(1).timeout
	$Instrucciones.hide()
	$BotonVolver.hide()
	$BotonPlay.show()
	$BotonQuit.show()
	$BotonIns.show()
	$Fondo.show()
