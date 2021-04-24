CREATE TABLE ALUMNO (DNI VARCHAR NOT NULL, APELLIDO1 VARCHAR NOT NULL UNIQUE, APELLIDO2 VARCHAR, CP_NOTIFICACION VARCHAR, CREDITOS_CF INTEGER, CREDITOS_FB INTEGER, CREDITOS_OB INTEGER, CREDITOS_OP INTEGER, CREDITOS_PE INTEGER, CREDITOS_TF INTEGER, CREDITOS_SUPERADOS INTEGER, DIRECCION_NOTIFICACION VARCHAR, EMAIL_INSTITUCIONAL VARCHAR NOT NULL, EMAIL_PERSONAL VARCHAR, FECHA_MATRICULA VARCHAR, GRUPOS_ASIGNADOS VARCHAR, LOCALIDAD_NOTIFICACION VARCHAR, MOVIL VARCHAR, NOMBRE VARCHAR NOT NULL UNIQUE, NOTA_MEDIA DOUBLE, NUM_ARCHIVO INTEGER, NUM_EXPEDIENTE INTEGER, PROVINCIA_NOTIFICACCION VARCHAR, TELEFONO VARCHAR, TURNO_PREFERENTE VARCHAR, PRIMARY KEY (DNI))
CREATE TABLE ASIGNATURA (REFERENCIA INTEGER NOT NULL, DTYPE VARCHAR(31), ASIGNATURA VARCHAR, CARACTER VARCHAR, CODIGO_1 INTEGER NOT NULL, CREDITOS_PRACTICA INTEGER, CREDITOS_TEORIA INTEGER NOT NULL, CURSO INTEGER, DURACION VARCHAR, OFERTADA BOOLEAN NOT NULL, OTRO_IDIOMA VARCHAR, PLAZAS VARCHAR, TOTAL_CREDITOS INTEGER, TITULACION_CODIGO INTEGER NOT NULL, MENCION VARCHAR, PRIMARY KEY (REFERENCIA))
CREATE TABLE ASIGNATURAS_MATRICULA (ASIGNATURA_REFERENCIA INTEGER NOT NULL, GRUPO_ID INTEGER, CURSO_ACADEMICO VARCHAR NOT NULL, EXPEDIENTE_NUM_EXPEDIENTE INTEGER NOT NULL, PRIMARY KEY (ASIGNATURA_REFERENCIA, CURSO_ACADEMICO, EXPEDIENTE_NUM_EXPEDIENTE))
CREATE TABLE CENTRO (ID INTEGER NOT NULL, DIRECCION VARCHAR NOT NULL, NOMBRE VARCHAR NOT NULL UNIQUE, TLF_CONSEJERIA VARCHAR, PRIMARY KEY (ID))
CREATE TABLE CLASE (DIA INTEGER NOT NULL, HORA_INICIO VARCHAR NOT NULL, HORA_FIN VARCHAR, ASIGNATURA_REFERENCIA INTEGER NOT NULL, GRUPO_ID INTEGER NOT NULL, PRIMARY KEY (DIA, HORA_INICIO, GRUPO_ID))
CREATE TABLE ENCUESTA (FECHA_DE_ENVIO VARCHAR NOT NULL, EXPEDIENTE_NUM_EXPEDIENTE INTEGER NOT NULL, PRIMARY KEY (FECHA_DE_ENVIO))
CREATE TABLE EXPEDIENTE (NUM_EXPEDIENTE INTEGER NOT NULL, ACTIVO BOOLEAN, NOTA_MEDIA_PROVISIONAL BIGINT, ALUMNO_DNI VARCHAR NOT NULL, TITULACION_CODIGO INTEGER NOT NULL, PRIMARY KEY (NUM_EXPEDIENTE))
CREATE TABLE GRUPO (ID INTEGER NOT NULL, ASIGNAR VARCHAR, CURSO INTEGER NOT NULL UNIQUE, INGLES BOOLEAN NOT NULL, LETRA VARCHAR NOT NULL UNIQUE, PLAZAS INTEGER, TURNO VARCHAR NOT NULL, VISIBLE BOOLEAN, TITULACION_CODIGO INTEGER NOT NULL, PRIMARY KEY (ID))
CREATE TABLE GRUPOS_POR_ASIGNATURA (CURSO_ACADEMICO INTEGER NOT NULL, OFERTA BOOLEAN, ASIGNATURA_REFERENCIA INTEGER NOT NULL, GRUPO_ID INTEGER NOT NULL, PRIMARY KEY (CURSO_ACADEMICO, ASIGNATURA_REFERENCIA, GRUPO_ID))
CREATE TABLE MATRICULA (CURSO_ACADEMICO VARCHAR NOT NULL, ESTADO VARCHAR, FECHA_MATRICULA VARCHAR NOT NULL, LISTADO_ASIGNATURAS VARCHAR, NUEVO_INGRESO BOOLEAN, NUM_ARCHIVO INTEGER, TURNO_PREFERENTE VARCHAR, EXPEDIENTE_NUM_EXPEDIENTE INTEGER NOT NULL, PRIMARY KEY (CURSO_ACADEMICO, EXPEDIENTE_NUM_EXPEDIENTE))
CREATE TABLE TITULACION (CODIGO INTEGER NOT NULL, CREDITOS INTEGER, NOMBRE VARCHAR, PRIMARY KEY (CODIGO))
CREATE TABLE CENTRO_TITULACION (centros_ID INTEGER NOT NULL, titulaciones_CODIGO INTEGER NOT NULL, PRIMARY KEY (centros_ID, titulaciones_CODIGO))
CREATE TABLE ENCUESTA_GRUPOS_POR_ASIGNATURA (encuestas_FECHA_DE_ENVIO VARCHAR NOT NULL, CURSO_ACADEMICO INTEGER NOT NULL, ASIGNATURA_REFERENCIA INTEGER NOT NULL, GRUPO_ID INTEGER NOT NULL, PRIMARY KEY (encuestas_FECHA_DE_ENVIO, CURSO_ACADEMICO, ASIGNATURA_REFERENCIA, GRUPO_ID))
CREATE TABLE GRUPO_ASIGNATURAS_MATRICULA (Grupo_ID INTEGER NOT NULL, ASIGNATURA_REFERENCIA INTEGER NOT NULL, CURSO_ACADEMICO VARCHAR NOT NULL, EXPEDIENTE_NUM_EXPEDIENTE INTEGER NOT NULL, PRIMARY KEY (Grupo_ID, ASIGNATURA_REFERENCIA, CURSO_ACADEMICO, EXPEDIENTE_NUM_EXPEDIENTE))
CREATE TABLE GRUPO_CLASE (Grupo_ID INTEGER NOT NULL, DIA INTEGER NOT NULL, HORA_INICIO VARCHAR NOT NULL, PRIMARY KEY (Grupo_ID, DIA, HORA_INICIO))
CREATE TABLE GRUPO_GRUPO (Grupo_ID INTEGER NOT NULL, grupos_ID INTEGER NOT NULL, PRIMARY KEY (Grupo_ID, grupos_ID))
CREATE TABLE GRUPO_GRUPOS_POR_ASIGNATURA (Grupo_ID INTEGER NOT NULL, CURSO_ACADEMICO INTEGER NOT NULL, ASIGNATURA_REFERENCIA INTEGER NOT NULL, PRIMARY KEY (Grupo_ID, CURSO_ACADEMICO, ASIGNATURA_REFERENCIA))
CREATE TABLE ASIGNATURA_TITULACION (optativas_REFERENCIA INTEGER NOT NULL, titulaciones_CODIGO INTEGER NOT NULL, PRIMARY KEY (optativas_REFERENCIA, titulaciones_CODIGO))
ALTER TABLE ASIGNATURA ADD CONSTRAINT FK_ASIGNATURA_TITULACION_CODIGO FOREIGN KEY (TITULACION_CODIGO) REFERENCES TITULACION (CODIGO)
ALTER TABLE ASIGNATURAS_MATRICULA ADD CONSTRAINT FK_ASIGNATURAS_MATRICULA_ASIGNATURA_REFERENCIA FOREIGN KEY (ASIGNATURA_REFERENCIA) REFERENCES ASIGNATURA (REFERENCIA)
ALTER TABLE ASIGNATURAS_MATRICULA ADD CONSTRAINT FK_ASIGNATURAS_MATRICULA_CURSO_ACADEMICO FOREIGN KEY (CURSO_ACADEMICO, EXPEDIENTE_NUM_EXPEDIENTE) REFERENCES MATRICULA (CURSO_ACADEMICO, EXPEDIENTE_NUM_EXPEDIENTE)
ALTER TABLE ASIGNATURAS_MATRICULA ADD CONSTRAINT FK_ASIGNATURAS_MATRICULA_GRUPO_ID FOREIGN KEY (GRUPO_ID) REFERENCES GRUPO (ID)
ALTER TABLE CLASE ADD CONSTRAINT FK_CLASE_GRUPO_ID FOREIGN KEY (GRUPO_ID) REFERENCES GRUPO (ID)
ALTER TABLE CLASE ADD CONSTRAINT FK_CLASE_ASIGNATURA_REFERENCIA FOREIGN KEY (ASIGNATURA_REFERENCIA) REFERENCES ASIGNATURA (REFERENCIA)
ALTER TABLE ENCUESTA ADD CONSTRAINT FK_ENCUESTA_EXPEDIENTE_NUM_EXPEDIENTE FOREIGN KEY (EXPEDIENTE_NUM_EXPEDIENTE) REFERENCES EXPEDIENTE (NUM_EXPEDIENTE)
ALTER TABLE EXPEDIENTE ADD CONSTRAINT FK_EXPEDIENTE_ALUMNO_DNI FOREIGN KEY (ALUMNO_DNI) REFERENCES ALUMNO (DNI)
ALTER TABLE EXPEDIENTE ADD CONSTRAINT FK_EXPEDIENTE_TITULACION_CODIGO FOREIGN KEY (TITULACION_CODIGO) REFERENCES TITULACION (CODIGO)
ALTER TABLE GRUPO ADD CONSTRAINT FK_GRUPO_TITULACION_CODIGO FOREIGN KEY (TITULACION_CODIGO) REFERENCES TITULACION (CODIGO)
ALTER TABLE GRUPOS_POR_ASIGNATURA ADD CONSTRAINT FK_GRUPOS_POR_ASIGNATURA_ASIGNATURA_REFERENCIA FOREIGN KEY (ASIGNATURA_REFERENCIA) REFERENCES ASIGNATURA (REFERENCIA)
ALTER TABLE GRUPOS_POR_ASIGNATURA ADD CONSTRAINT FK_GRUPOS_POR_ASIGNATURA_GRUPO_ID FOREIGN KEY (GRUPO_ID) REFERENCES GRUPO (ID)
ALTER TABLE MATRICULA ADD CONSTRAINT FK_MATRICULA_EXPEDIENTE_NUM_EXPEDIENTE FOREIGN KEY (EXPEDIENTE_NUM_EXPEDIENTE) REFERENCES EXPEDIENTE (NUM_EXPEDIENTE)
ALTER TABLE CENTRO_TITULACION ADD CONSTRAINT FK_CENTRO_TITULACION_titulaciones_CODIGO FOREIGN KEY (titulaciones_CODIGO) REFERENCES TITULACION (CODIGO)
ALTER TABLE CENTRO_TITULACION ADD CONSTRAINT FK_CENTRO_TITULACION_centros_ID FOREIGN KEY (centros_ID) REFERENCES CENTRO (ID)
ALTER TABLE ENCUESTA_GRUPOS_POR_ASIGNATURA ADD CONSTRAINT FK_ENCUESTA_GRUPOS_POR_ASIGNATURA_CURSO_ACADEMICO FOREIGN KEY (CURSO_ACADEMICO, ASIGNATURA_REFERENCIA, GRUPO_ID) REFERENCES GRUPOS_POR_ASIGNATURA (CURSO_ACADEMICO, ASIGNATURA_REFERENCIA, GRUPO_ID)
ALTER TABLE ENCUESTA_GRUPOS_POR_ASIGNATURA ADD CONSTRAINT ENCUESTAGRUPOSPORASIGNATURAencuestasFECHA_DE_ENVIO FOREIGN KEY (encuestas_FECHA_DE_ENVIO) REFERENCES ENCUESTA (FECHA_DE_ENVIO)
ALTER TABLE GRUPO_ASIGNATURAS_MATRICULA ADD CONSTRAINT FK_GRUPO_ASIGNATURAS_MATRICULA_Grupo_ID FOREIGN KEY (Grupo_ID) REFERENCES GRUPO (ID)
ALTER TABLE GRUPO_ASIGNATURAS_MATRICULA ADD CONSTRAINT GRUPO_ASIGNATURAS_MATRICULA_ASIGNATURA_REFERENCIA FOREIGN KEY (ASIGNATURA_REFERENCIA, CURSO_ACADEMICO, EXPEDIENTE_NUM_EXPEDIENTE) REFERENCES ASIGNATURAS_MATRICULA (ASIGNATURA_REFERENCIA, CURSO_ACADEMICO, EXPEDIENTE_NUM_EXPEDIENTE)
ALTER TABLE GRUPO_CLASE ADD CONSTRAINT FK_GRUPO_CLASE_Grupo_ID FOREIGN KEY (Grupo_ID) REFERENCES GRUPO (ID)
ALTER TABLE GRUPO_CLASE ADD CONSTRAINT FK_GRUPO_CLASE_DIA FOREIGN KEY (DIA, HORA_INICIO, GRUPO_ID) REFERENCES CLASE (DIA, HORA_INICIO, GRUPO_ID)
ALTER TABLE GRUPO_GRUPO ADD CONSTRAINT FK_GRUPO_GRUPO_grupos_ID FOREIGN KEY (grupos_ID) REFERENCES GRUPO (ID)
ALTER TABLE GRUPO_GRUPO ADD CONSTRAINT FK_GRUPO_GRUPO_Grupo_ID FOREIGN KEY (Grupo_ID) REFERENCES GRUPO (ID)
ALTER TABLE GRUPO_GRUPOS_POR_ASIGNATURA ADD CONSTRAINT FK_GRUPO_GRUPOS_POR_ASIGNATURA_Grupo_ID FOREIGN KEY (Grupo_ID) REFERENCES GRUPO (ID)
ALTER TABLE GRUPO_GRUPOS_POR_ASIGNATURA ADD CONSTRAINT FK_GRUPO_GRUPOS_POR_ASIGNATURA_CURSO_ACADEMICO FOREIGN KEY (CURSO_ACADEMICO, ASIGNATURA_REFERENCIA, GRUPO_ID) REFERENCES GRUPOS_POR_ASIGNATURA (CURSO_ACADEMICO, ASIGNATURA_REFERENCIA, GRUPO_ID)
ALTER TABLE ASIGNATURA_TITULACION ADD CONSTRAINT FK_ASIGNATURA_TITULACION_optativas_REFERENCIA FOREIGN KEY (optativas_REFERENCIA) REFERENCES ASIGNATURA (REFERENCIA)
ALTER TABLE ASIGNATURA_TITULACION ADD CONSTRAINT FK_ASIGNATURA_TITULACION_titulaciones_CODIGO FOREIGN KEY (titulaciones_CODIGO) REFERENCES TITULACION (CODIGO)
