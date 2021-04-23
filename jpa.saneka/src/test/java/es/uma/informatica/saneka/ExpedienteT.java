package es.uma.informatica.saneka;

import static org.junit.Assert.*;

import java.util.Properties;
import java.util.logging.Logger;

import javax.ejb.embeddable.EJBContainer;
import javax.naming.Context;

import org.apache.commons.math3.analysis.function.Exp;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import es.uma.informatica.ejb.exceptions.ExpedienteExistenteException;
import es.uma.informatica.ejb.exceptions.ExpedienteNoEncontradoException;
import es.uma.informatica.ejb.exceptions.SanekaException;
import es.uma.informatica.ejb.saneka.GestionAlumno;
import es.uma.informatica.ejb.saneka.GestionExpediente;
import es.uma.informatica.jpa.saneka.Alumno;
import es.uma.informatica.jpa.saneka.Expediente;
import es.uma.informatica.jpa.saneka.Titulacion;

public class ExpedienteT {

	private static final Logger LOG = Logger.getLogger(ExpedienteT.class.getCanonicalName());
	
	private static final String UNIDAD_PERSITENCIA_PRUEBAS = "SanekaTest";
	
	//Path a las entidades que se usaran en los test ~/classes/{MiClaseEJB}
	private static final String EXPEDIENTE_EJB = "java:global/classes/ExpedienteEJB";
	private static final String TITULACION_EJB = "java:global/classes/TitulacionEJB";
	private static final String ALUMNO_EJB = "java:global/classes/AlumnoEJB";
	
	//Declaramos las entidades a usar en los test
	private GestionExpediente gestionExpediente;
	private GestionTitulacion gestionTitulacion;
	private GestionAlumno gestionAlumno;

	@Before
	public void setUp() throws Exception {
		//Inicializamos las clases y la base de datos
		gestionTitulacion = (GestionTitulacion) SuiteTest.ctx.lookup(TITULACION_EJB);
		gestionExpediente = (GestionExpediente) SuiteTest.ctx.lookup(EXPEDIENTE_EJB);
		gestionAlumno = (GestionAlumno) SuiteTest.ctx.lookup(ALUMNO_EJB);
		BaseDatos.inicializaBaseDatos(UNIDAD_PERSITENCIA_PRUEBAS);
	}
	
	@Test
	public void testInsertarExpediente() {
		Titulacion tituEntity = gestionTitulacion.devolverTitulacion(1234);
		Alumno alumnoEntity = gestionAlumno.devolverAlumno("090");
		Expediente exp = new Expediente(1, tituEntity, alumnoEntity);
		try {
			try {
				gestionExpediente.insertarExpediente(1, exp);
			} catch (ExpedienteExistenteException e) {
				fail("El expediente ya existe");
			}
		}catch (SanekaException e) {
			throw new RuntimeException(e);
		}
		
		Expediente expEntity = gestionExpediente.devolverExpediente(1);
		assertEquals(expEntity.hashCode(), exp.hashCode());
	}
	
	@Test
	public void testInsertarExpedienteExistente() {
		Titulacion tituEntity = gestionTitulacion.devolverTitulacion(1234);
		Alumno alumnoEntity = gestionAlumno.devolverAlumno("090");
		Expediente exp = new Expediente(12345, tituEntity, alumnoEntity);
		try {
			try {
				gestionExpediente.insertarExpediente(12345, exp);
				fail("Deberia dar error porque ya existe");
			} catch (ExpedienteExistenteException e) {
				//OK
			}
		}catch (SanekaException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Test
	public void testModificarExpediente() {
		Titulacion tituEntity = gestionTitulacion.devolverTitulacion(1234);
		Alumno alumnoEntity = gestionAlumno.devolverAlumno("090");
		Expediente exp = new Expediente(12345, tituEntity, alumnoEntity);
		try {
			try {
				gestionExpediente.modificarExpediente(12345, exp);
			} catch (ExpedienteNoEncontradoException e) {
				fail("Expediente no encontrado");
			}	
		} catch (SanekaException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Test
	public void testModificarExpedienteNoEncontrado() {
		
		try {
			Expediente exp = new Expediente(1, true, 5);
			try {
				gestionExpediente.modificarExpediente(1, exp);
				fail("Deberia dar error porque no lo encuentra");
			} catch (ExpedienteNoEncontradoException e) {
				//OK
			}	
		} catch (SanekaException e) {
			throw new RuntimeException(e);
		}
	}

}
