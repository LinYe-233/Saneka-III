ALTER TABLE ASIGNATURA DROP FOREIGN KEY FK_ASIGNATURA_TITULACION_CODIGO
ALTER TABLE ASIGNATURAS_MATRICULA DROP FOREIGN KEY FK_ASIGNATURAS_MATRICULA_ASIGNATURA_REFERENCIA
ALTER TABLE ASIGNATURAS_MATRICULA DROP FOREIGN KEY FK_ASIGNATURAS_MATRICULA_CURSO_ACADEMICO
ALTER TABLE ASIGNATURAS_MATRICULA DROP FOREIGN KEY FK_ASIGNATURAS_MATRICULA_GRUPO_ID
ALTER TABLE CLASE DROP FOREIGN KEY FK_CLASE_GRUPO_ID
ALTER TABLE CLASE DROP FOREIGN KEY FK_CLASE_ASIGNATURA_REFERENCIA
ALTER TABLE ENCUESTA DROP FOREIGN KEY FK_ENCUESTA_EXPEDIENTE_NUM_EXPEDIENTE
ALTER TABLE EXPEDIENTE DROP FOREIGN KEY FK_EXPEDIENTE_TITULACION_CODIGO
ALTER TABLE EXPEDIENTE DROP FOREIGN KEY FK_EXPEDIENTE_ALUMNO_ID
ALTER TABLE GRUPO DROP FOREIGN KEY FK_GRUPO_TITULACION_CODIGO
ALTER TABLE GRUPOS_POR_ASIGNATURA DROP FOREIGN KEY FK_GRUPOS_POR_ASIGNATURA_ASIGNATURA_REFERENCIA
ALTER TABLE GRUPOS_POR_ASIGNATURA DROP FOREIGN KEY FK_GRUPOS_POR_ASIGNATURA_GRUPO_ID
ALTER TABLE MATRICULA DROP FOREIGN KEY FK_MATRICULA_EXPEDIENTE_NUM_EXPEDIENTE
ALTER TABLE CENTRO_TITULACION DROP FOREIGN KEY FK_CENTRO_TITULACION_titulaciones_CODIGO
ALTER TABLE CENTRO_TITULACION DROP FOREIGN KEY FK_CENTRO_TITULACION_centros_ID
ALTER TABLE ENCUESTA_GRUPOS_POR_ASIGNATURA DROP FOREIGN KEY FK_ENCUESTA_GRUPOS_POR_ASIGNATURA_CURSO_ACADEMICO
ALTER TABLE ENCUESTA_GRUPOS_POR_ASIGNATURA DROP FOREIGN KEY ENCUESTAGRUPOSPORASIGNATURAencuestasFECHA_DE_ENVIO
ALTER TABLE GRUPO_ASIGNATURAS_MATRICULA DROP FOREIGN KEY FK_GRUPO_ASIGNATURAS_MATRICULA_Grupo_ID
ALTER TABLE GRUPO_ASIGNATURAS_MATRICULA DROP FOREIGN KEY GRUPO_ASIGNATURAS_MATRICULA_ASIGNATURA_REFERENCIA
ALTER TABLE GRUPO_CLASE DROP FOREIGN KEY FK_GRUPO_CLASE_Grupo_ID
ALTER TABLE GRUPO_CLASE DROP FOREIGN KEY FK_GRUPO_CLASE_DIA
ALTER TABLE GRUPO_GRUPO DROP FOREIGN KEY FK_GRUPO_GRUPO_grupos_ID
ALTER TABLE GRUPO_GRUPO DROP FOREIGN KEY FK_GRUPO_GRUPO_Grupo_ID
ALTER TABLE GRUPO_GRUPOS_POR_ASIGNATURA DROP FOREIGN KEY FK_GRUPO_GRUPOS_POR_ASIGNATURA_Grupo_ID
ALTER TABLE GRUPO_GRUPOS_POR_ASIGNATURA DROP FOREIGN KEY FK_GRUPO_GRUPOS_POR_ASIGNATURA_CURSO_ACADEMICO
DROP TABLE ALUMNO
DROP TABLE ASIGNATURA
DROP TABLE ASIGNATURAS_MATRICULA
DROP TABLE CENTRO
DROP TABLE CLASE
DROP TABLE ENCUESTA
DROP TABLE EXPEDIENTE
DROP TABLE GRUPO
DROP TABLE GRUPOS_POR_ASIGNATURA
DROP TABLE MATRICULA
DROP TABLE TITULACION
DROP TABLE CENTRO_TITULACION
DROP TABLE ENCUESTA_GRUPOS_POR_ASIGNATURA
DROP TABLE GRUPO_ASIGNATURAS_MATRICULA
DROP TABLE GRUPO_CLASE
DROP TABLE GRUPO_GRUPO
DROP TABLE GRUPO_GRUPOS_POR_ASIGNATURA
DELETE FROM SEQUENCE WHERE SEQ_NAME = 'SEQ_GEN'