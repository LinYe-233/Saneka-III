package es.uma.informatica.saneka;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.sql.Date;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;

import javax.ejb.embeddable.EJBContainer;
import javax.naming.Context;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;

import es.uma.informatica.ejb.exceptions.AsignaturaNoEncontradoException;
import es.uma.informatica.ejb.exceptions.CentroExistenteException;
import es.uma.informatica.ejb.exceptions.ClaseExistenteException;
import es.uma.informatica.ejb.exceptions.SanekaException;
import es.uma.informatica.ejb.saneka.GestionAsignatura;
import es.uma.informatica.ejb.saneka.GestionCentros;
import es.uma.informatica.ejb.saneka.GestionClases;
import es.uma.informatica.jpa.saneka.Asignatura;
import es.uma.informatica.jpa.saneka.Centro;
import es.uma.informatica.jpa.saneka.Clase;
import es.uma.informatica.jpa.saneka.Grupo;

public class ClaseT {
	/*
	private static final Logger LOG = Logger.getLogger(ClaseT.class.getCanonicalName());
	private static final String CLASES_EJB = "java:global/classes/ClasesEJB";
	private static final String ASIGNATURAS_EJB = "java:global/classes/AsignaturaEJB";
	private static final String GLASSFISH_CONFIGI_FILE_PROPERTY = "org.glassfish.ejb.embedded.glassfish.configuration.file";
	private static final String CONFIG_FILE = "target/test-classes/META-INF/domain.xml";
	private static final String UNIDAD_PERSITENCIA_PRUEBAS = "SanekaTest";
	
	
	private GestionClases gestionClase;
	private GestionAsignatura gestionAsignatura;
	
	@Test
	public void testIntertarClase() {
		Grupo grupo = new Grupo(3,"C","Manana",false);
		Asignatura asig = new Asignatura();
		Clase clase = new Clase(2,"2021-04-11",asig,grupo);
		
		try {
			gestionClase.insertarClase(asig.getReferencia(), clase);
		}catch (AsignaturaNoEncontradoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClaseExistenteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			List<Clase> clases = gestionClase.obtenerClasesDeAsignatura(asig.getReferencia());
			assertEquals(1, clases.size());
			assertTrue(asig.equals(clase.getAsignatura()));
			assertTrue(grupo.equals(clase.getGrupo()));
			assertEquals(2,clase.getDia());
			assertEquals("2021-04-11",clase.getHora_inicio());
			assertEquals("2021-04-11",clase.getAsignatura());
		}catch(SanekaException e) {
			fail("No debería lanzar excepción");
		}
	}
	@Test @Ignore
	public void testInsertarClaseAsignaturaNoEncontrado() {
		Grupo grupo = new Grupo(3,"C","Manana",false);
		Asignatura asig = new Asignatura();
		Clase clase = new Clase(2,"2021-04-11",asig,grupo);
		
	}
	*/

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
	
	

}
