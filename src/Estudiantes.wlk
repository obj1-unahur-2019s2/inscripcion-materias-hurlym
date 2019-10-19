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
		return cursadas.any({cursada=>cursada.getMateria()== mate})
		
		//CONSULTO SI ESTA EN LA LISTA LA MATERIA APROBADA
		//return (cursadas.contains(mate))
		
		
		
			
		
	}
	
	method condicionesMateria(materia){
		//VER COMO SE SABE SI LA MATERIA QUE SE DESEA AGREGAR PERTENECE A LA CARRERA A LA QUE
		//ESTA INSCRIPTO
		
		//NO SE SI ES CORRECTO
		//RECORRO LA LISTA DE CARRERAS A LAS QUE ESTA INSCRIPTO EL ALUMNO
		//Y A CADA CARRERA LE ENVIO LA MATERIA A LA QUE SE DESEA INSCRIBIR
		//SI LA MATERIA PERTENECE A LA CARRERA ME DEVOLVERA TRUE Y AGREGO LA MATERIA 
		//A LAS INSCRIPCIONES DEL ALUMNO
		return((self.existeMateriaEnCarrera(materia)) 
			&& (not self.estaAprobada(materia))
			&&(not self.estaAnotado(materia)) 
			&& (self.tengoLasCorrelativas(materia))
		)
			
		
		
	}
	
	//CONSULTO LAS MATERIAS CORRELATIVAS DE LA MATERIA
	//Y BUSCO EN ESA LISTA QUE SE ENCUENTREN TODAS LAS MATERIAS EN LA LISTA DE CURSADAS
	method tengoLasCorrelativas(mate){
		return mate.correlativasNecesarias().all({materia=>cursadas.contains(materia)})
	}
	
	//CONSULTO SI ALGUNA SI SE ENCUENTRA LA MATERIA EN ALGUNA DE LAS CARRERAS A LAS QUE ESTA
	//ANOTADO
	method existeMateriaEnCarrera(materia)
	{
		return carrerasInscriptas.any({carrera=>carrera.perteneceMateria(materia)})
	}
	
	//DAR DE BAJA ESTUDIANTE
	method darDeBaja(materia)
	{
		//ELIMINO LA MATERIA DE LA LISTA DE MATERIAS INSCRIPTAS
		materia.EstudiantesInscript().remove(self)
		
		//CONSULTO SI HAY LISTA DE ESPERA
		if(materia.verListaDeEspera().size()>0){
			//SI HAY LISTA DE ESPERA BUSCO EL PRIMER ALUMNO DE LA LISTA Y LE AGREGO LA MATRIA A 
			//SU LISTA DE MATERIAS INSCRIPTAS
			//PERO COMO SE HACE
			materia.pasarListaEsperaAInscripto()
			//
		}
	}
	
	//AGREGO LA MATERIA A MATERIAS INSCRIPTAS
	method inscribirMateria(materia)
	{
		if(not self.condicionesMateria(materia))
		{
			self.error("No se puede inscribir en la materia")
		}
		else
		{
			
			materia.anotar().add(self)
		}
	}
	
	method aprobarMateria(mate,  nota){
		//CONSULTO SI ESTA EN LA LISTA LA MATERIA QUE DESEO AGREGAR A LA LISTA DE APROBADAS
		if(cursadas.contains(mate))
		{
			//ACA DEBERIA IR EL MENSAJE DE ERROR
			self.error("La materia esta aprobada")
		}
		else
		{
			cursa.setMateria(mate)
			cursa.setNota(nota)
			cursadas.add(cursa)
		}
		
		
		
		
	}
	
	method materiasInscriptas()
	{
		const materiasAnotado = []
		self.listarMateriasCarreras().filter({mate=>self.estaAnotadoEnMateria(mate)})
		
		return materiasAnotado
		
	}
	
	method materiasListaEspera()
	{
		const materiasListaEspera = []
		self.listarMateriasCarreras().filter({mate=>mate.estaListaEspera(self)})
		
		
		return materiasListaEspera
		
	}
	
	
	method listarMateriasCarreras()
	{
		const todasLasMateriasCarreras = []
		carrerasInscriptas.foreach(({carre=>todasLasMateriasCarreras.addAll(carre.materias())}))
		return todasLasMateriasCarreras
	}
		
	
	
	
	method estaAnotado(materia){
		
		
		//CONSULTO LA CANTIDAD DE MATERIAS APROBADAS
		return(materiasInscriptas.contains(materia))
			
		
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
	
	//PUNTO 9 SABER TODAS LAS MATERIAS DE UNA CARRERA A LA QUE SE PUEDE INSCRIBIR UN ESTUDIANTE QUE ESTA INSCRIPTO
	method estaInscriptoCarrera(carrera){
		//CONSULTO SI LA CARRERA EXISTE EN LAS INSCRIPCION DE CARRERAS
		return(carrerasInscriptas.contains(carrera))
		
	}
	
	//CONSULTO SI EL ESTUDIANTE SE ENCUENTRA ANOTADO EN LISTA DE ESPERA EN LA MATERIA
	method estaAnotadoEnMateria(mate){
		return(mate.estaListaEspera(self) or mate.estaAnotado(self))
	}
	
	method mateiasRestaAnotar(carrera){
		if (not self.estaInscriptoCarrera(carrera)){
			self.error("El estudiante no esta inscripto en la carrera")
			return false
		}
		else{
			//NO SE SI SE PUEDE HACER QUE SE CUMPLA UNA CONDICION NEGADA
			return(carrera.materias().filter({mate=>not self.estaAnotadoEnMateria(mate)}))
		}
	}
	
	
	
	
	
	
	
	
}
