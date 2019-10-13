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
	
	method estaAprobada(mate){
		
		//NO SE CUAL DE LAS DOS CONSULTAS ES CORRECTA
		return (cursadas.forEach({cursada=>cursada.getNombre()}==mate.getNombre()))
		
		//CONSULTO SI ESTA EN LA LISTA LA MATERIA APROBADA
		//return (cursadas.contains(mate))
		
		
		
			
		
	}
	
	method inscribirMateria(materia){
		//VER COMO SE SABE SI LA MATERIA QUE SE DESEA AGREGAR PERTENECE A LA CARRERA A LA QUE
		//ESTA INSCRIPTO
		
		//NO SE SI ES CORRECTO
		//RECORRO LA LISTA DE CARRERAS A LAS QUE ESTA INSCRIPTO EL ALUMNO
		//Y A CADA CARRERA LE ENVIO LA MATERIA A LA QUE SE DESEA INSCRIBIR
		//SI LA MATERIA PERTENECE A LA CARRERA ME DEVOLVERA TRUE Y AGREGO LA MATERIA 
		//A LAS INSCRIPCIONES DEL ALUMNO
		if(carrerasInscriptas.forEach({carrera=>carrera.perteneceMateria(materia)}))
		{
			//CONSULTO SINO LA TIENE APROBADA
			if((cursadas.forEach({cursada=>cursada.getNombre()}==materia.getNombre())))
			{
				//CONSULTO SI YA NO ESTA INSCRIPTO EN ESA MATERIA
				if(!materiasInscriptas.contains(materia))
				{
					
					if(materia.correlativasNecesarias().forEach({}))
					{
						
					}
				}
			}
			//NO SE SI ES CORRECTA LA SINTAXIS
			//LO QUE DESEO ES RECORRER TODAS LAS MATERIAS CURSADAS Y VER 
			if(!cursadas.forEach({cursada=>cursada.getNombre()}==materia.getNombre()))
			materiasInscriptas.add(materia)
		}
		
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
