import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANASTE! WIII")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {
	var property position = game.origin() //Con esto el pj arranca desde 0,0

	method image() = "silvestre.png"

	//Generamos el cambio de mov en silvestre
	method position() = game.at(self.restriccion(),0)

	//Como nos pide que restrinjamos el mov, le ponemos que el minimo es 3.
	method restriccion(){
		return pepita.position().x().max(3)

	}

}
