import Materia.*

class Carrera {
	
	
	
	
	const materias = []
	
	method agregarMateria(materia){
		materias.add(materia)
	}
	
	method perteneceMateria(materia){
		
		return materias.contains(
			{mate => materias == materia })
		
	}
	
}
