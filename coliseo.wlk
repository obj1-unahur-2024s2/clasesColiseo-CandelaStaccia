import grupos.*
import gladiadores.*

object coliseo {
    method combatirEnGrupos(unGrupo, otroGrupo) {
        unGrupo.combatir(otroGrupo)
    }

    method combatirConGladiador(unGrupo, unGladiador) {
        unGrupo.combatirCon(unGladiador)
    }

    method curarUno(unGladiador) {
        unGladiador.recibirCuracion()
    }

    method curarGrupo(unGrupo) {
        unGrupo.curarATodos()
    }
}