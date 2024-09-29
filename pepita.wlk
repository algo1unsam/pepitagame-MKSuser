import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(1,1) //Con esto el pj arranca desde 0,0

	// Cambiamos el condicional para que haya una imagen de gris tmb
	method image() {
		return if (self.estaEnElNido()) {
			"pepita-grande.png"
			} else if (self.esAtrapada() or self.estaCansada()){
				"pepita-gris.png"
				}
					else {
						"pepita.png"}
	}
	
	// Creamos este metodo para el condicional de gris
	method esAtrapada(){
		return self.position() == silvestre.position()
	}
	
	// Si está cansada se emite un booleano y se procede a finalizar el juego
	method estaCansada() {
		if (energia <= 0)
			self.apagar()
		return energia <= 0
		
	}

	// Metodo que desencadena el apagado
	method apagar(){
		if (energia <= 0){
			game.schedule(0000, { game.stop() })
		}
	}

	// Morfa y borra lo comido
	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)

	}

	// Se calcula la nueva cantidad de energia tras volar
	// Y se evalúa si está cansada(energía <= 0)
	method vola(kms) {
		energia = energia - kms * 9
		self.estaCansada()
	}

	//Evaluamos dónde va a dejar a pepita la nueva posición del key. Si está fuera de los límites no se mueve.
	//Se resta 1 para que no tome el valor máximo, sino quedaría fuera.
	method irA(nuevaPosicion) {
			if ((nuevaPosicion.x().between(0,game.width()-1)) && (nuevaPosicion.y().between(0,game.height()-1))){
				if (self.energia() > 0) {
					self.vola(position.distance(nuevaPosicion))
					position = nuevaPosicion
				}
			}
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

	// Configuramos la gravedad, haciendo que caiga 1 lugar por iteración del onTick
	// Validamos que no baje mas alla del 0 para que no rompa
	method gravedad(){
    	if (position.y() > 0){
			const y = (position.y()-1)
			position = game.at(position.x(),y)
		}
	}
}

