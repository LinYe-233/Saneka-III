package es.uma.informatica.saneka;

import static org.junit.Assert.*;

import java.util.Properties;
import java.util.logging.Logger;

import javax.ejb.embeddable.EJBContainer;
import javax.naming.Context;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import es.uma.informatica.ejb.exceptions.AsignaturaExistenteException;
import es.uma.informatica.ejb.exceptions.SanekaException;
import es.uma.informatica.ejb.exceptions.TitulacionNoExistenteException;
import es.uma.informatica.ejb.saneka.GestionAsignatura;
import es.uma.informatica.ejb.saneka.GestionExpediente;
import es.uma.informatica.ejb.saneka.GestionTitulacion;
import es.uma.informatica.jpa.saneka.Asignatura;
import es.uma.informatica.jpa.saneka.Titulacion;

public class AsignaturaT {
	
	private static final Logger LOG = Logger.getLogger(Asignatura.class.getCanonicalName());
	private static final String UNIDAD_PERSITENCIA_PRUEBAS = "SanekaTest";
	
	//Path a las entidades que se usaran en los test ~/classes/{MiClaseEJB}
	private static final String ASIGNATURA_EJB = "java:global/classes/AsignaturaEJB";
	private static final String TITULACION_EJB = "java:global/classes/TitulacionEJB";
	
	private static Context ctx;
	
	//Declaramos las entidades a usar en los test
	private GestionAsignatura gestionAsignatura;
	
	private GestionTitulacion gestionTitulacion;


	@Before
	public void setUp() throws Exception {
		//Inicializamos las clases y la base de datos
		gestionTitulacion = (GestionTitulacion) SuiteTest.ctx.lookup(TITULACION_EJB);
		gestionAsignatura = (GestionAsignatura) SuiteTest.ctx.lookup(ASIGNATURA_EJB);
		BaseDatos.inicializaBaseDatos(UNIDAD_PERSITENCIA_PRUEBAS);
	}

	@Test
	public void introducirAsignatura() throws SanekaException {
		
		Titulacion titul = gestionTitulacion.devolverTitulacion(1234);
		
		Asignatura as = new Asignatura(11111, true, 201, 6, titul);
		Integer ref = 1234;
		as.setReferencia(ref);
		
		try {
			gestionAsignatura.insertarAsignatura(ref, as);
		} catch (AsignaturaExistenteException aee) {
			fail("Asignatura ya existente");
		}	
	}

}
