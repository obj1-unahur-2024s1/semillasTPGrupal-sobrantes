import parcelas.*
class Planta{
	const property altura 
	const property anioObtencion 
	//var property horasToleradas
	//const parcelas = []
	
	method cuantasHorasTolera() //= horasToleradas
	method esFuerte() = self.cuantasHorasTolera() >= 10 /*horasTolerads*/ 
	method espacioOcupado() 
	method daSemillas()  { return self.cuantasHorasTolera() >= 10}
	method esIdeal(unaParcela)
}

class Menta inherits Planta{
	override method cuantasHorasTolera() = 6
	override method daSemillas(){return super() and altura >0.4}
	override method espacioOcupado() = altura * 3
	override method esIdeal(unaParcela) = unaParcela.superficie() > 6
}

class Soja inherits Planta{
	override method  cuantasHorasTolera() = if(altura < 0.5){6} else if (altura.between(0.5,1)){7} else{9}
	override method espacioOcupado() = altura / 2
	override method daSemillas(){return super() and anioObtencion >= 2007 and altura > 1 }
	override method esIdeal(unaParcela){return unaParcela.horasDeSol() == self.cuantasHorasTolera()}
}

class Quinoa inherits Planta{
	override method espacioOcupado() = 0.5
	override method daSemillas(){return super() and anioObtencion <= 2005 }
	override method esIdeal(unaParcela)= not unaParcela.plantas().any{planta=>planta.altura()>1.5}
}

//PARTE 2 VARIEDADES
class SojaTransgenica inherits Soja{
	override method daSemillas(){return false}
	override method esIdeal(unaParcela) = unaParcela.cantidadMaxDePlantas() == 1
	}

class HierbaBuena inherits Menta{
	override method espacioOcupado() = super()*2 //(altura * 3)*2
}