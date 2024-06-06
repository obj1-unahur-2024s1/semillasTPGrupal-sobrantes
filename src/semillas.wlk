import parcelas.*
class Plantas{
	const property altura 
	const property anioObtencion 
	var property horasToleradas
	const parcelas = []
	
	method cuantasHorasTolera() = horasToleradas
	method esFuerte() = horasToleradas >= 10
	method espacioOcupado() 
	method daSemillas(){ return horasToleradas >= 10}
	method esIdeal()
}

class Menta inherits Plantas{
	override method cuantasHorasTolera() = 6
	override method daSemillas(){return super() and altura >0.4}
	override method espacioOcupado() = altura * 3
	override method esIdeal() = parcelas.superficie() > 5
}

class Soja inherits Plantas{
	override method  cuantasHorasTolera() = if(altura < 0.5){6} else if (altura >= 0.5 and altura <= 1){7} else{9}
	override method espacioOcupado() = altura / 2
	override method daSemillas(){return super() and anioObtencion >= 2007 and altura > 1 }
	override method esIdeal(){return parcelas.cantidadHS() == cuantasHorasTolera()}
}

class Quinoa inherits Plantas{
	override method espacioOcupado() = 0.5
	override method daSemillas(){return super() and anioObtencion <= 2005 }
	override method esIdeal(){}
}

//PARTE 2 VARIEDADES
class SojaTransgenica inherits Soja{
	override method daSemillas(){return false}
	override method esIdeal(){return parcelas.cantidadMaxDePlantas() == 1}
}
class HierbaBuena inherits Menta{
	override method espacioOcupado() = (altura * 3)*2
}