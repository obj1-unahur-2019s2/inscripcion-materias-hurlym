import Materia.*

class Carrera {
	
	
	
	
	const property materias = []
	
	method agregarMateria(materia){
		materias.add(materia)
	}
	
	method perteneceMateria(materia){
		
		return materias.contains(materia)
		
	}
	
}
