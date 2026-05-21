import cosas.*
//PARTE1
//EL CAMION

object camion {
    const property  cosa = []
    const pesoDeLaCargaMaximo = 2500
    const tara =  1000
    var pesoAcumulado = 100
    
    

//CARGA Y DESCARGA CAMION

    //lo que voy acumulando en la carga
    method pesoAcumuladoDeCarga(){
        return pesoAcumulado
    }
//el maximo que puede habe de carga
    method pesoDeLaCargaMaximo(){
        return pesoDeLaCargaMaximo
    }

    method pesoMaximoDeLCamionConCargaIncluida(){
        return (self.pesoAcumuladoDeCarga() + self.pesoCamion()).min(2500)
    }
//carga 1 cosa y actualiza el peso acumulado
    method cargar1Cosa(unaCosa) {
            var pesoCosa = 0
            cosa.add(unaCosa)
            pesoCosa = cosa.last().peso()
            pesoAcumulado = pesoAcumulado + pesoCosa

    }

    method cargarCosaAlCamion(unaCosa){
        if(unaCosa.peso() <= self.pesoMaximoDeLCamionConCargaIncluida()){
            cosa.add(unaCosa)
            pesoAcumulado = pesoAcumulado + unaCosa.peso()
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
//peso del camion + la carga    

    method pesoCamionConCarga(){
        return  self.pesoCamion() + self.pesoAcumuladoDeCarga()
        
    }

//peso total de la carga es par?
    method pesoEsPar(){
        return cosa.map({c=>c.peso().even()})
    }

    method hayAlgunaCosaQuePesa(unValor){
        return cosa.map({c=>c.peso() }).any({c=>c.peso()== unValor})
    }

    method primerCosaCargada(){
        
    }
    
    method tipoDePeligro(){


    }


}