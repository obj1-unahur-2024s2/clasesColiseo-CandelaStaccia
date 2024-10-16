import armas.*
import grupos.*


class Mirmillones {
    var vida = 100
    const property arma
    var property armadura
    var property fuerza //no dice q sube o baja

    method vida() = vida

    method destreza() = 15 //para no pisarlo al instanciar

    method pelear(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self) //el contraataque
    }

    method atacar(unGladiador) {
        unGladiador.recibirAtaque(self.poderDeAtaque())
    }

    method poderDeAtaque() = arma.poderDeAtaque() + fuerza

    method defensa() = armadura.defensa(self) + self.destreza()

    method recibirAtaque(unValor) {
        vida = vida - 0.max(unValor - self.defensa())
    }

    method puedePelear() = vida > 0

    method crearUnGrupo(otroGladiador) {
        const nuevoGrupo = new Grupo(
            gladiadores = [self, otroGladiador],
            nombre = "mirmillolandia"
            )
        return nuevoGrupo
    }

    method recibirCuracion() {
        vida = vida + 15
    }
}

class Dimachaerus {
    var vida = 100
    const property armas = []
    var property destreza

    method vida() = vida

    method fuerza() = 10 

    method pelear(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self) //el contraataque
    }

    method atacar(unGladiador) {
        unGladiador.recibirAtaque(self.poderDeAtaque())
        destreza = destreza + 1
    }

    method poderDeAtaque() = self.fuerza() + armas.sum({a => a.poderDeAtaque()})

    method defensa() = destreza / 2

    method recibirAtaque(unValor) {
        vida = vida - 0.max(unValor - self.defensa())
    }

    method puedePelear() = vida > 0

    method crearUnGrupo(otroGladiador) {
        const nuevoGrupo = new Grupo(
            gladiadores = [self, otroGladiador],
            nombre = "D-" + (self.poderDeAtaque() + otroGladiador.poderDeAtaque())
            )
        return nuevoGrupo
    }

    method recibirCuracion() {
        vida = vida + 15
    }
}