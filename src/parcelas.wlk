import semillas.*
class Parcela {
	const property ancho
	const property largo
	const property horasDeSol
	const property plantas = []
	
	//method cantidadDeHS() = horasDeSol ya lo tiene el property
	method seAsociaBien(planta)	
	method superficie() = ancho * largo
	method cantidadMaxDePlantas(){return if(ancho > largo){self.superficie() / 5} else {self.superficie() / 3 + largo}}//se agregó self. a superficie()
	method tieneComplicaciones() = plantas.any{planta => planta.cuantasHorasTolera() < horasDeSol} 
	method cantPlantas()= self.plantas().size()
	method cantPlantasSeASociaBien()= self.plantas().count{planta=>self.seAsociaBien(planta)}
	method plantar(unaPlanta){
		if(plantas.size()>=self.cantidadMaxDePlantas() or (self.horasDeSol()-2)>unaPlanta.cuantasHorasTolera()){
			self.error("No se puede plantar")
		}else{
			plantas.add(unaPlanta)
		}	
		
	
	}
	
}

class ParcelaEco inherits Parcela{
	override method seAsociaBien(planta)= not self.tieneComplicaciones() and planta.esIdeal(self) 
}


class ParcelaInd inherits Parcela{
	override method seAsociaBien(planta)= self.plantas().size()>=2 and planta.esFuerte() 
}