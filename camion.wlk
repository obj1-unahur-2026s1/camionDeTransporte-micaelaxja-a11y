import cosas.*
//PARTE1
//EL CAMION

object camion {
    const property  cosa = []
    const tara =  1000
    var pesoAcumulado = 100
    const cosasConNivelDePeligrosidad = []


//CARGA Y DESCARGA CAMION

//lo que voy acumulando en la carga

    method pesoAcumulado(){
        return pesoAcumulado
    }
//el maximo que puede habe de carga

    method pesoDeLaCargaMaximo(){  //es una constante
        return 2500
    }

    method pesoTotalDeLCamionConCargaIncluida(){
        return self.pesoAcumulado() + self.pesoCamion()
    }
//carga 1 cosa y actualiza el peso acumulado
    method cargar1Cosa(unaCosa) {
            var pesoCosa = 0
            cosa.add(unaCosa)
            pesoCosa = cosa.last().peso()
            pesoAcumulado = pesoAcumulado + pesoCosa
    }

    method espacioEnElCamion(){
        return self. pesoDeLaCargaMaximo() - self.pesoTotalDeLCamionConCargaIncluida() 
    }
    method cargar1CosaAlcamion(unacosa){

        if(unacosa.peso()<= self.espacioEnElCamion()){
            cosa.add(unacosa)
            pesoAcumulado = pesoAcumulado + unacosa.peso()
        
        }
    }
        
//elimina 1 cosa y actualiza el peso acumulado
    method descargar1Cosa(unaCosa) {
        cosa.remove(unaCosa)
        pesoAcumulado = pesoAcumulado - unaCosa.peso()

    }

//PESO 

//peso del camion solo
    method pesoCamion(){
        return tara

    }

//peso total de la carga es par?
    method pesoEsPar(){
        return cosa.map({c=>c.peso().even()})
    }

    method hayAlgunaCosaQuePesa(unValor){

        const valoresDeCosas = cosa.map({c=>c.peso()}) // lista de pesos
        return valoresDeCosas.any({p=>p == unValor})
    }

    method primerCosaCargadaConPeligrosidad(){
        if(not cosasConNivelDePeligrosidad.isEmpty()){
            cosasConNivelDePeligrosidad.first()
        }
        
    }
    // self.error("Lista Vacia")

    method todasLasCosasQueSuperanNivel(nivelDePeligrosidad){
    
        return cosa.filter({ c => c.peligrosidad() > nivelDePeligrosidad })
    }
    
    method listaDeCosasQueSuperanElNivel_(unaCosa){
        return cosa.filter({c=>c.peligrosidad() > unaCosa.peligrosidad()})
    }

    method elCamionEstaExcedido() {
        return self.pesoTotalDeLCamionConCargaIncluida() > self.pesoDeLaCargaMaximo()
    
    }

    method puedeCircularEnRuta(nivel){
        return not self.elCamionEstaExcedido() and self.objCargadosNoSuperanNivel(nivel)
    }

    method objCargadosNoSuperanNivel(nivel){
        return not self.todasLasCosasQueSuperanNivel(nivel)

    }

//Agregados al camión
    
    method tieneAlgunaCosaQuePeseEntre_Y_(valorMin, valorMax){

        return self.listaConPesosDeLasCosas().any({pesos=>pesos.between(valorMin, valorMax)})
    }
    method listaConPesosDeLasCosas(){
        return  cosa.map({c=>c.peso()})
    }

    method cosaMasPesadaQueTieneCargada(){
        return self.listaConPesosDeLasCosas().max()
    }


}
