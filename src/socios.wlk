import viajes.*

class Socio{
	var edad
	var idiomas = []
	var actividades = []
	var maximo
	
	method edad() = edad
	method idiomas() = idiomas
	method actividades() = actividades
	method adoraElSol(){
		return actividades.all({a => a.sirveParaBroncearse()})
	}
	method actividadesEsforzadas(){
		return actividades.filter({a => a.implicaEsfuerzo()})
	}
	method registrarActividad(actividad){
		if(actividades.size() == maximo){
			self.error("Ya hizo el maximo de actividades")
		}
		actividades.add(actividad)
	}
	method leAtrae(actividad)
	method yaHizoLaActividad(actividad){
		return actividades.any({a => a == actividad})
	}
}

class SocioTranquilo inherits Socio{
	override method leAtrae(actividad){
		return actividad.diasQueLleva() >= 4
	}
}

class SocioCoherente inherits Socio{
	override method leAtrae(actividad){
		return if(self.adoraElSol()){actividad.sirveParaBroncearse()}else{actividad.implicaEsfuerzo()}
	}
}

class SocioRelajado inherits Socio{
	method algunIdiomaEsIgualA(idioma){
		return idiomas.any({i => i == idioma})
	}
	method hablaAlgunIdiomaDeLaActividad(actividad){
		return actividad.idiomas().any({i => self.algunIdiomaEsIgualA(i)})
	}
	override method leAtrae(actividad){
		return self.hablaAlgunIdiomaDeLaActividad(actividad)
	}
}
