import Estudiantes.*

class Materia {
	var property nombre = "";
	var property credito = 0;
	const materiasCorrelativas = []
	
	var property cupo = 30;
	const listaEsperaAlumnos = []
	
	
	method setNombre(nomb){
		nombre = nomb
	}
	
	method getNombre(){
		return nombre
	}
	
	method setCredito(cred){
		credito = cred
	}
	
	method getCredito(){
		return credito
	}
	
	method agregarCorrlatividades(materia){
		materiasCorrelativas.add(materia)
	}
	
	method correlativasNecesarias()
	{
		return materiasCorrelativas
	}
	
	method getCupo()
	{
		return cupo
		
	}
	
	method descontarCupo()
	{
		cupo--
	}
	
	method agregarListaEspera(estudiante){
		listaEsperaAlumnos.add(estudiante)
	}
	
	method verListaDeEspera()
	{
		return listaEsperaAlumnos
	}
	
	/* 
	 * method jornadaLaboral(){
		if(self.obrerosDisponibles().size() == 0 ){
			self.error("No hay obreros disponibles para trabajar")
		}
		self.obrerosDisponibles().forEach{ obrero => obrero.jornadaLaboral(self) }
		
	}*/
	
	
}
