import Materia.*

class Cursada {
	
	var _materia;
	
	var property _nota = 0;
	
	method setMateria(mate){
		_materia = mate
	}
	
	method setNota(nota){
		_nota = nota
	}
	
	method getNota(){
		return _nota
	}
	
	method getMateria(){
		return _materia
	}
	
}
