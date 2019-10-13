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
	
	method aprobarMateria(materia,  nota){
		
		cursa.setMateria(materia)
		cursa.setNota(nota)
		cursadas.add(cursa)
		
		
	}
}
