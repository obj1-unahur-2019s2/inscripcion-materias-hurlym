import Materia.*

import Carrera.*

import Cursada.*

class Estudiantes {
	
	var cursa = new Cursada()
	
	
	
	const materiasInscriptas = []
	
	const carrerasInscriptas = []
	
	const cursadas = []
	
	
	
	
	method inscribirCarrera(carrera){
		carrerasInscriptas.add(carrera)
	}
	
	method inscribirMateria(materia){
		if(materia)
		materiasInscriptas.add(materia)
	}
	
	method aprobarMateria(mate,  nota){
		//CONSULTO SI ESTA EN LA LISTA LA MATERIA QUE DESEO AGREGAR A LA LISTA DE APROBADAS
		if(cursadas.contains(mate))
		{
			//ACA DEBERIA IR EL MENSAJE DE ERROR
			
		}
		else
		{
			cursa.setMateria(mate)
			cursa.setNota(nota)
			cursadas.add(cursa)
		}
		
		
		
		
	}
	
	method estaAprobada(mate){
		//CONSULTO SI ESTA EN LA LISTA LA MATERIA APROBADA
		return(cursadas.contains(mate))
		
			
		
	}
	
	method cantAprobadas(){
		//CONSULTO LA CANTIDAD DE MATERIAS APROBADAS
		return(cursadas.count())
			
		
	}
	
	method saberPromedio(){
		//COMO RECORRO LA LISTA PARA SABER EN CADA MATERIA Y LEER LA POSICIOND DE LA NOTA
		var suma
		//RECORRO TODA LA LISTA Y SUMO LA NOTA DE CADA UNA 
		cursadas.forEach(suma = suma + {cursada=>cursada.getNota()})
		//A LA SUMA OBTENIDA LA DIVIDO POR LA CANTIDAD DE NOTAS Y DEVUELVO EL RESULTADO OBTENIDO
		return suma / cursadas.count()
			
		
	}
	
	
	
	
}
