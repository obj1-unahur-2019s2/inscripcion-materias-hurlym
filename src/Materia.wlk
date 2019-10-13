class Materia {
	var property nombre = "";
	var property credito = 0;
	const materiasCorrelativas = []
	
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
	
	/* 
	 * method jornadaLaboral(){
		if(self.obrerosDisponibles().size() == 0 ){
			self.error("No hay obreros disponibles para trabajar")
		}
		self.obrerosDisponibles().forEach{ obrero => obrero.jornadaLaboral(self) }
		
	}*/
	
	
}
