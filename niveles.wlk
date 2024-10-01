import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
		//config.seguirPepita()
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		game.onTick(1200, "gravedad", { pepita.gravedad() })

	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
		game.onTick(1200, "gravedad", { pepita.gravedad() })
	}

}

object config {

	method configurarTeclas() {

			// Teclas para manipular a pepita sin que está ataca a character
			keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1)) })
			keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
			keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1)) })
			keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1))})
			
			// Tecla para comer 
			keyboard.c().onPressDo({ pepita.come(game.uniqueCollider(pepita))})

			// Para testear cuanta energía tenemos
			keyboard.enter().onPressDo{game.say(pepita, pepita.energia().toString())}
		} 
	
	// Seteamos la colision de pepita para con lo que venga
	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita) })
	
	}


	/*Otra forma de seguir pero
	method seguirPepita(){
		keyboard.left().onPressDo({ silvestre.irA(silvestre.position().left(1)) })
		keyboard.right().onPressDo({ silvestre.irA(silvestre.position().right(1))})

	}*/
}