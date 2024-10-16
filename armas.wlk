class ArmaDeFilo {
    const property longitud
    var property filo

    method poderDeAtaque() = longitud * filo
}

class ArmaContundente {
    const property peso

    method poderDeAtaque() = peso
}
//clases pq cambian sus atributos en cada instancia que se cree

object casco {
    method defensa(unGladiador) = 10 //se agrega unLuchador para el polimorfismo, aunque no se lo necesite
}//no tiene sentido hacer una clase: no tiene atributos
//es lo mismo tener 1 instancia que muchas. Devuelve lo mismo SIEMPRE, no hay diferencias

object escudo {
    method defensa(unGladiador) {
        return 5 + unGladiador.destreza() * 0.1
    }
}