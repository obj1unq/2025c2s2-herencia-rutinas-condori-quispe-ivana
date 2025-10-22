class Rutina {
    method descanso(tiempoDePractica)
    var property intensidad  
    //method intensidad() //pq? Pq cada rutina necesita entender el mensaje
    method caloriasQueGastan(tiempo){
        return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    } 
}
class Running inherits Rutina {
    override method descanso(tiempo) {
          return if (tiempo > 20) 5 else 2
    }
}
class Maraton inherits Running{
  override method caloriasQueGastan(tiempo){
    return super(tiempo) * 2
  }
}
class Remo inherits Rutina{
    override method intensidad() {
      return 1.5
    }
    override method descanso(tiempoDePractica) {
      return tiempoDePractica / 5
    }

}

class RemoDeCompeticion inherits Remo {
    override method intensidad() {
      return 1.7
    }
    override method descanso(tiempoDePractica) {
      return (super(tiempoDePractica) - 3).max(2)
    }
}

class Persona {
    var property tiempoDeRutina
    var peso 
    var property rutina
    var property kilosPorCaloria //por ahora sera variable, ya no, sera metodo

    method hacerRutina() {
        if(peso>50){
            peso = peso - (rutina.caloriasQueGastan(tiempoDeRutina)) / kilosPorCaloria
        }
        
    }
}

class PersonaSedentaria inherits Persona(
    kilosPorCaloria = 7000// es mejor actualizar el setter
){

}

class PersonaAtleta inherits Persona(
    tiempoDeRutina = 90,
    kilosPorCaloria = 8000
)
{
    override method hacerRutina() {
        peso = peso - super()
    }
}