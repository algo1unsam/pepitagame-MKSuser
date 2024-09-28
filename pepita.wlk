import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(1,1) //Con esto el pj arranca desde 0,0

	//Cambiamos el condicional para que haya una imagen de gris tmb
	method image() {
		return if (self.estaEnElNido()) {
			"pepita-grande.png"
			} else if (self.esAtrapada() or self.estaCansada()){
				"pepita-gris.png"
				}
					else {
						"pepita.png"}
	}
	
	//Creamos este metodo para el condicional de gris
	method esAtrapada(){
		return self.position() == silvestre.position()
	}
	
	method estaCansada() {
		return energia <= 0
		self.apagar()
		
	}

	method apagar(){
		if (energia <= 0){
			game.stop()
		}
	}

	//Morfa y borra lo comido
	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
			if ((self.position().x().between(0,9)) && (self.position().y().between(0,9))){
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

}

