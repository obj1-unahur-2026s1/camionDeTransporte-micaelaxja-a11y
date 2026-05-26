import  camion.*

object knightRider {
    var property peso = 500
    var property peligrosidad = 10

    method embalaje() {
        self.peso()
        self.peligrosidad() / 2
    
    }
    }

object bumblebee{
    var property peso = 800
    var  estaTranformadoEnAuto = true // Por defecto arranca como auto (puede ser false)

//PELIGROSIDad
    
    method estaTranformadoEnAuto(){  //getter
        return estaTranformadoEnAuto
    }
    
    method cambiarARobot(){
        estaTranformadoEnAuto = false
    }
    
    // El método que te pide la lógica de peligrosidad
    method peligrosidad() {
        if (self.estaTranformadoEnAuto()){
            return 15
        } else 
        return 30
    }

    method embalaje(){
        self.peso()
        self.peligrosidad() / 2
    }

}


object paqueteDeLadrillos {
    const property peligrosidad = 2
    var cantidadDeLadrillos = 10
    const pesoPorLadrillo = 2

//ladrillos

    method cantidadDeLadrillos(cantidad){ //setter
        cantidadDeLadrillos = cantidadDeLadrillos  + cantidad
        return cantidadDeLadrillos
    }

    method cantidadDeLadrillos(){ //getter
        return cantidadDeLadrillos
    }

    method peso(){
        return pesoPorLadrillo * self.cantidadDeLadrillos()
    }

    method embalaje(){
        self.peso()
        self.peligrosidad() / 2
    }

}

object arenaAGranel{
    var property peso = 0
    const property peligrosidad = 1


}

object bateriaAntiaerea{
    const property peso = 200
    const property peligrosidad = 0
    const estaArmada = true



//peso
    method modificarPeso(){
        if(self.estaConLosMisiles()){
            return self.peso() + 300
        }
        else{
            return self.peso() + 200
        }
    }
    method sumarPeligrosidad() {
        if(self.estaConLosMisiles()){
            self.peligrosidad() + 100
        }
    }   
    
    method estaConLosMisiles(){
        return estaArmada
    }

    method estaDesarmada(){
        return not estaArmada
    }

}

object contenedorPortuario{
    var property peso = 100
    
    const cosas = [arenaAGranel, bateriaAntiaerea, paqueteDeLadrillos]

//peso del contenedor + suma de las cosas que tiene adentro

    method pesoTotal(){
        return peso + self.sumaTotalDeCosas()
    }

    method sumaTotalDeCosas(){
        return cosas.sum({c=>c.pesoCosa()})
    }

    method peligrosidad(){
        if(self.listaDeNivelesDePeligrosidad().isEmpty()){
            return 0
        }
        else{
        return self.listaDeNivelesDePeligrosidad().max()
        }
    }

    method listaDeNivelesDePeligrosidad(){
        return cosas.map({c=>c.peligrosidad()})
    }


}

object residuosRadioactivos{
    var property peso = 0
    const property peligrosidad = 200


}

object embalajeDeSeguridad{
        var property peso = unaCosaAdentro.peso()
        var property peligrosidad = unaCosaAdentro.peligrosidad() / 2

        var property  unaCosaAdentro = residuosRadioactivos //inicia con ese objecto

} 