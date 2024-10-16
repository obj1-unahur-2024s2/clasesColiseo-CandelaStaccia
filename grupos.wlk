import gladiadores.*
import armas.*


class Grupo {
    const property gladiadores = []
    const property nombre
    var peleas = 0

    method peleas() = peleas

    method agregarGladiador(unGladiador) {
      gladiadores.add(unGladiador)
    } 

    method quitar(unGladiador) {
        gladiadores.remove(unGladiador)
    }

    method aumentarPeleas() {
        peleas = peleas + 1
    }

    method combatir(otroGrupo) {
        self.aumentarPeleas()
        otroGrupo.aumentarPeleas()
        (1..3).forEach({
            round => self.elMasFuerte().pelear(otroGrupo.elMasFuerte())
        })
    }

    method elMasFuerte() {
        const puedenPelear = gladiadores.filter({g => g.puedePelear()})
        if(puedenPelear.isEmpty())
            self.error("No hay gladiadores que puedan pelear") //corta la ejecución
        else
            return puedenPelear.max({g => g.fuerza()})
    }

    method combatirCon(unGladiador) {
        self.aumentarPeleas()
        if(unGladiador.puedePelear())
            (1..3).forEach({
            round => self.elMasFuerte().pelear(unGladiador)
        }) //creo
    }

    method curarATodos() {
        gladiadores.forEach({g => g.recibirCuracion()})
    }
}