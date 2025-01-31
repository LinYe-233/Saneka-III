package es.uma.informatica.ejb.saneka;

import java.util.List;

import javax.ejb.Local;

import es.uma.informatica.ejb.exceptions.GrupoExistenteException;
import es.uma.informatica.ejb.exceptions.GrupoNoEncontradoException;
import es.uma.informatica.ejb.exceptions.TitulacionNoEncontradoException;
import es.uma.informatica.jpa.saneka.Grupo;
import es.uma.informatica.jpa.saneka.Titulacion;

@Local
public interface GestionGrupo {
	public void insertarGrupo(Integer titu,Grupo grupo) throws TitulacionNoEncontradoException, GrupoExistenteException;
	public List<Grupo> obtenerGruposDeTitulacion(Integer titu) throws TitulacionNoEncontradoException;
	public void actualizarGrupo(Integer titu,Grupo grupo) throws TitulacionNoEncontradoException, GrupoNoEncontradoException;
	public void eliminarGrupo(Integer titu,Grupo grupo) throws TitulacionNoEncontradoException, GrupoExistenteException;
	public void eliminarTodosGrupos(Integer titu) throws TitulacionNoEncontradoException;
	public Grupo obtenerGrupo(Integer id) throws GrupoNoEncontradoException;
	public String mostrarGrupo(Grupo grupo);

}
