import Estudiantes.*

class Materia {
	var property nombre = "";
	var property credito = 0;
	const materiasCorrelativas = []
	const property EstudiantesInscript = []
	const EstudianteListaEspera =  []
	
	var property cupo;
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
		
	}
	
	method verListaDeEspera()
	{
		return listaEsperaAlumnos
	}
	
	method anotar(estudiante){
		if(self.completa()){
			listaEsperaAlumnos.add(estudiante)
		}
		else
		{
			EstudiantesInscript.add()
		}
		
	}
	
	method pasarListaEsperaAInscripto(estudiante){
		//PRIMERO LEO LA POSICION 0 DE LA LISTA PARA TENER EL ESTUDIANTE
		//Y LO AGREGO A LA LISTA DE INSCRIPTOS
		EstudiantesInscript.add(listaEsperaAlumnos.get(0))
		//LUEGO ELIMINO EL ESTUDIANTE DE LA POSICION 0 DE LA LISTA DE ESPERA
		listaEsperaAlumnos.remove(0)
		
	}
	
	method completa(){
		return EstudiantesInscript.size() == cupo
	}
	
	method estaAnotado(estudiante){
		return(EstudiantesInscript.contains(estudiante))
			
	}
	
	method estaListaEspera(estudiante){
		return(listaEsperaAlumnos.contains(estudiante))
			
	}
	
	
	
	
	/* 
	 * method jornadaLaboral(){
		if(self.obrerosDisponibles().size() == 0 ){
			self.error("No hay obreros disponibles para trabajar")
		}
		self.obrerosDisponibles().forEach{ obrero => obrero.jornadaLaboral(self) }
		
	}*/
	
	
}
