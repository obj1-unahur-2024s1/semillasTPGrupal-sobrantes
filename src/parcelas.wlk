import semillas.*
class Parcelas {
	const property ancho
	const property largo
	const property horasDeSol
	const plantas = []
	
	method cantidadDeHS() = horasDeSol
	method superficie() = ancho * largo
	method cantidadMaxDePlantas(){return if(ancho > largo){superficie() / 5} else {superficie() / 3 + largo}}
	method tieneComplicaciones() = plantas.any{plantas >= plantas.cuantasHorasTolera() < horasDeSol}
	method plantar(unaPlanta){plantas.add(unaPlanta)}
	
}
