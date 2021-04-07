package es.uma.informatica.jpa.saneka;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Embeddable;
@Embeddable
public class ClaseId implements Serializable{
	
		private Integer Dia;
		private Date hora_inicio;
		private static final long serialVersionUID = 1L;
		public Integer getDia() {
			return Dia;
		}
		public void setDia(Integer dia) {
			Dia = dia;
		}
		public Date getHora_inicio() {
			return hora_inicio;
		}
		public void setHora_inicio(Date hora_inicio) {
			this.hora_inicio = hora_inicio;
		}
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((Dia == null) ? 0 : Dia.hashCode());
			result = prime * result + ((hora_inicio == null) ? 0 : hora_inicio.hashCode());
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
			ClaseId other = (ClaseId) obj;
			if (Dia == null) {
				if (other.Dia != null)
					return false;
			} else if (!Dia.equals(other.Dia))
				return false;
			if (hora_inicio == null) {
				if (other.hora_inicio != null)
					return false;
			} else if (!hora_inicio.equals(other.hora_inicio))
				return false;
			return true;
		}
		@Override
		public String toString() {
			return "ClaseId [Dia=" + Dia + ", hora_inicio=" + hora_inicio + "]";
		}

}
