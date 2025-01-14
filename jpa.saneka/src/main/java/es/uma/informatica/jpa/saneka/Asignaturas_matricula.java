package es.uma.informatica.jpa.saneka;

import java.io.Serializable;
import javax.persistence.*;

import es.uma.informatica.jpa.saneka.Matricula.MatriculaId;

/**
 * Entity implementation class for Entity: Asignaturas_matricula
 *
 */
@Entity
@IdClass(Asignaturas_matricula.Asignaturas_matriculaId.class)
public class Asignaturas_matricula implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@ManyToOne
	private Asignatura asignatura;
	@Id
	@ManyToOne
	private Matricula matricula;
	@ManyToOne
	private Grupo grupo;
	
	public static class Asignaturas_matriculaId implements Serializable {

		private static final long serialVersionUID = 1L;
		private int asignatura;
		private MatriculaId matricula;
		
		public int getAsignatura() {
			return asignatura;
		}
		public void setAsignatura(int asignatura) {
			this.asignatura = asignatura;
		}
		public MatriculaId getMatricula() {
			return matricula;
		}
		public void setMatricula(MatriculaId matricula) {
			this.matricula = matricula;
		}
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + asignatura;
			result = prime * result + ((matricula == null) ? 0 : matricula.hashCode());
			return result;
		}
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Asignaturas_matriculaId other = (Asignaturas_matriculaId) obj;
			if (asignatura != other.asignatura)
				return false;
			if (matricula == null) {
				if (other.matricula != null)
					return false;
			} else if (!matricula.equals(other.matricula))
				return false;
			return true;
		}
		
	}
	
	public Asignaturas_matricula() {
		super();
	}
   
	public Asignaturas_matricula(Asignatura asig, Matricula matr) {
		this.asignatura=asig;
		this.matricula=matr;
	}
}
