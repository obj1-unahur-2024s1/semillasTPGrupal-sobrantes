import parcelas.*
import semillas.*

object inta {
	
	const parcelas = []	
	
	method promedioDePlantas() = parcelas.sum{parcela=>parcela.cantPlantas()} / parcelas.size()
	
	method parcelaMasAutosustentable(){
		
	return parcelas.filter({parcela=> parcela.plantas().size() >= 4}).max({parcela=>parcela.cantPlantasSeASociaBien()})

	}
}
