
class Viaje{
	var idiomas = #{}
	
	method idiomas() = idiomas
	method cantidadDeIdiomas(){
		return self.idiomas().size()
	}
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method diasQueLleva()
	method esInteresante(){
		return self.cantidadDeIdiomas() > 1
	}
	method esRecomendadaPara(socio){
		return self.esInteresante() and socio.leAtrae(self) and socio.yaHizoLaActividad(self)
	}
}

class ViajePlaya inherits Viaje{
	var largo
	
	override method diasQueLleva(){
		return largo / 500
	}
	override method implicaEsfuerzo(){
		return largo > 1200
	}
	override method sirveParaBroncearse(){
		return true
	}
}

class ViajeCiudad inherits Viaje{
	var atracciones = []
	
	method cantidadDeAtracciones() = atracciones.size()
	override method diasQueLleva(){
		return self.cantidadDeAtracciones() / 2
	}
	override method implicaEsfuerzo(){
		return self.cantidadDeAtracciones() >= 5 and self.cantidadDeAtracciones() <= 8
	}
	override method sirveParaBroncearse(){
		return false
	}
	override method esInteresante(){
		return super() or self.cantidadDeAtracciones() == 5
	}
}

class ViajeTropical inherits ViajeCiudad{
	override method diasQueLleva(){
		return super() + 1
	}
	override method sirveParaBroncearse(){
		return true
	}
}

class SalidaTrekking inherits Viaje{
	var kilometros
	var diasDeSol
	
	override method diasQueLleva(){
		return kilometros / 50
	}
	override method implicaEsfuerzo(){
		return kilometros > 80
	}
	override method sirveParaBroncearse(){
		return diasDeSol > 200 or ((diasDeSol >= 100 and diasDeSol <= 200) and kilometros > 120)
	}
	override method esInteresante(){
		return super() and diasDeSol > 140
	}
}

class ClaseGimnasia inherits Viaje{
	override method idiomas() = "español"
	override method diasQueLleva() = 1
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
	override method esRecomendadaPara(socio){
		return socio.edad() >= 20 and socio.edad() <= 30
	}
}

class Taller inherits Viaje{
	var libros = []
	
	method cantidadDeLibros() = libros.size()
	method autores(){
		return libros.map({l => l.nombreAutor()}).asSet()
	}
	method todosSonDelMismoAutor(){
		return self.autores().size() == 1
	}
	method hayAlgunoDeMuchasPaginas(){
		return libros.any({l => l.paginas() > 500})
	}
	method idiomasUsados(){
		return libros.map({l => l.idioma()}).asSet()
	}
	override method diasQueLleva() = libros.size() + 1
	override method implicaEsfuerzo(){
		return self.hayAlgunoDeMuchasPaginas() or
		 	  (self.todosSonDelMismoAutor() and self.cantidadDeLibros() > 1)
	}
	override method sirveParaBroncearse() = false
	override method esRecomendadaPara(socio){
		return socio.idiomas().size() > 1
	}
}

class Libro{
	var idioma
	const paginas
	const nombreAutor
	
	method idioma() = idioma
	method paginas() = paginas
	method nombreAutor() = nombreAutor
}

