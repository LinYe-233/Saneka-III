package es.uma.informatica.ejb.saneka;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import es.uma.informatica.ejb.exceptions.GrupoNoEncontradoException;
import es.uma.informatica.ejb.exceptions.ClaseExistenteException;
import es.uma.informatica.ejb.exceptions.ClaseNoEncontradoException;
import es.uma.informatica.jpa.saneka.Grupo;

import es.uma.informatica.jpa.saneka.Clase;

@Stateless
public class ClaseEJB implements GestionClase{
	
	private static final Logger LOG = Logger.getLogger(ClaseEJB.class.getCanonicalName());
	
	@PersistenceContext(name="jpa.saneka")
	private EntityManager em;
	@Override
	public void insertarClase(Integer grupo,Clase clase) throws ClaseExistenteException, GrupoNoEncontradoException{
		Grupo GrupoEntity = em.find(Grupo.class,grupo);
		if(GrupoEntity == null) {
			throw new GrupoNoEncontradoException();
		}
		Clase claseExistente = em.find(Clase.class, new Clase.ClaseId(clase.getDia(),clase.getHora_fin(),clase.getGrupo().getID()));
		if(claseExistente != null) {
			throw new ClaseExistenteException();
		}
		clase.setGrupo(GrupoEntity);
		em.persist(clase);
	}

	@Override
	public List<Clase> obtenerClasesDeGrupo(Integer grupo) throws GrupoNoEncontradoException {
		Grupo GrupoEntity = em.find(Grupo.class,grupo);
		if(GrupoEntity == null) {
			throw new GrupoNoEncontradoException();
		}
		return new ArrayList<>(GrupoEntity.getClases());
	}

	@Override
	public void actualizarClase(Integer Grupo, Clase clase) throws GrupoNoEncontradoException,ClaseNoEncontradoException {
		Grupo GrupoEntity = em.find(Grupo.class,Grupo);
		if(GrupoEntity == null) {
			throw new GrupoNoEncontradoException();
		}
		Clase claseExistente = em.find(Clase.class, new Clase.ClaseId(clase.getDia(),clase.getHora_fin(),clase.getGrupo().getID()));
		if(claseExistente == null) {
			throw new ClaseNoEncontradoException();
		}
		// Actualizamos 
		claseExistente.setAsignatura(clase.getAsignatura());
		claseExistente.setHora_fin(clase.getHora_fin());;
		em.persist(GrupoEntity);
		
	}

	@Override
	public void eliminarClase(Integer Grupo, Clase clase) throws GrupoNoEncontradoException, ClaseNoEncontradoException {
		Grupo GrupoEntity = em.find(Grupo.class,Grupo);
		if(GrupoEntity == null) {
			throw new GrupoNoEncontradoException();
		}
		Clase claseExistente = em.find(Clase.class, new Clase.ClaseId(clase.getDia(),clase.getHora_fin(),clase.getGrupo().getID()));
		if(claseExistente == null) {
			throw new ClaseNoEncontradoException();
		}
		List<Clase> clases = GrupoEntity.getClases();
		clases.remove(clase);
		GrupoEntity.setClases(clases);
		em.persist(GrupoEntity);
		
	}

	@Override
	public void eliminarTodosClases(Integer Grupo) throws GrupoNoEncontradoException {
		Grupo GrupoEntity = em.find(Grupo.class,Grupo);
		if(GrupoEntity == null) {
			throw new GrupoNoEncontradoException();
		}
		List<Clase> clases = new ArrayList<>();
		GrupoEntity.setClases(clases);
		em.persist(GrupoEntity);
		
	}


	


}
