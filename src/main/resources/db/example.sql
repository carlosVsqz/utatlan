-- Generado por Oracle SQL Developer Data Modeler 4.0.3.853
--   en:        2015-04-17 19:18:40 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g


DROP TABLE C_Articulo CASCADE CONSTRAINTS;

DROP TABLE C_Categoría CASCADE CONSTRAINTS;

DROP TABLE C_Foto CASCADE CONSTRAINTS;

DROP TABLE C_Perfil CASCADE CONSTRAINTS;

DROP TABLE C_Usuario CASCADE CONSTRAINTS;

DROP TABLE C_Votos CASCADE CONSTRAINTS;

CREATE TABLE C_Articulo
(
    id             INTEGER NOT NULL,
    Titulo         VARCHAR2(45),
    Contenido      CLOB,
    FechaCreacion  DATE,
    C_Categoría_id INTEGER NOT NULL,
    C_Usuario_id   INTEGER NOT NULL
);
ALTER TABLE C_Articulo
    ADD CONSTRAINT C_Articulo_PK PRIMARY KEY (id);

CREATE TABLE C_Categoría
(
    id        INTEGER NOT NULL,
    Categoria VARCHAR2(45)
);
ALTER TABLE C_Categoría
    ADD CONSTRAINT C_Categoría_PK PRIMARY KEY (id);

CREATE TABLE C_Foto
(
    id            INTEGER NOT NULL,
    path          VARCHAR2(255),
    C_Articulo_id INTEGER NOT NULL
);
ALTER TABLE C_Foto
    ADD CONSTRAINT C_Foto_PK PRIMARY KEY (id);

CREATE TABLE C_Perfil
(
    id           INTEGER NOT NULL,
    Nombre       VARCHAR2(45),
    Apellido     VARCHAR2(45),
    Pais         VARCHAR2(45),
    Direccion    VARCHAR2(45),
    C_Usuario_id INTEGER NOT NULL
);
ALTER TABLE C_Perfil
    ADD CONSTRAINT C_Perfil_PK PRIMARY KEY (id);

CREATE TABLE C_Usuario
(
    id            INTEGER NOT NULL,
    usuario       VARCHAR2(45),
    password      VARCHAR2(45),
    fechacreacion DATE
);
ALTER TABLE C_Usuario
    ADD CONSTRAINT C_Usuario_PK PRIMARY KEY (id);

CREATE TABLE C_Votos
(
    id            INTEGER NOT NULL,
    C_Usuario_id  INTEGER NOT NULL,
    C_Articulo_id INTEGER NOT NULL
);
ALTER TABLE C_Votos
    ADD CONSTRAINT C_Votos_PK PRIMARY KEY (id);

ALTER TABLE C_Articulo
    ADD CONSTRAINT C_Articulo_C_Categoría_FK FOREIGN KEY (C_Categoría_id) REFERENCES C_Categoría (id);

ALTER TABLE C_Articulo
    ADD CONSTRAINT C_Articulo_C_Usuario_FK FOREIGN KEY (C_Usuario_id) REFERENCES C_Usuario (id);

ALTER TABLE C_Foto
    ADD CONSTRAINT C_Foto_C_Articulo_FK FOREIGN KEY (C_Articulo_id) REFERENCES C_Articulo (id);

ALTER TABLE C_Perfil
    ADD CONSTRAINT C_Perfil_C_Usuario_FK FOREIGN KEY (C_Usuario_id) REFERENCES C_Usuario (id);

ALTER TABLE C_Votos
    ADD CONSTRAINT C_Votos_C_Articulo_FK FOREIGN KEY (C_Articulo_id) REFERENCES C_Articulo (id);

ALTER TABLE C_Votos
    ADD CONSTRAINT C_Votos_C_Usuario_FK FOREIGN KEY (C_Usuario_id) REFERENCES C_Usuario (id);


INSERT INTO C_CATEGORÍA (ID, CATEGORIA)
VALUES ('1', 'Programación');
INSERT INTO C_CATEGORÍA (ID, CATEGORIA)
VALUES ('2', 'Linux');
INSERT INTO C_CATEGORÍA (ID, CATEGORIA)
VALUES ('3', 'Desarrollo Web');
INSERT INTO C_CATEGORÍA (ID, CATEGORIA)
VALUES ('4', 'Servidores');
INSERT INTO C_CATEGORÍA (ID, CATEGORIA)
VALUES ('5', 'Posicionamiento en internet');
INSERT INTO C_CATEGORÍA (ID, CATEGORIA)
VALUES ('6', 'Redes');
INSERT INTO C_CATEGORÍA (ID, CATEGORIA)
VALUES ('7', 'HTML');
INSERT INTO C_CATEGORÍA (ID, CATEGORIA)
VALUES ('8', 'CSS');

INSERT INTO C_USUARIO (ID, USUARIO, PASSWORD, FECHACREACION)
VALUES ('1', 'Us1', '11111', TO_DATE('2013-07-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_USUARIO (ID, USUARIO, PASSWORD, FECHACREACION)
VALUES ('2', 'Us2', '456', TO_DATE('2013-08-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_USUARIO (ID, USUARIO, PASSWORD, FECHACREACION)
VALUES ('3', 'Us3', '789', TO_DATE('2013-09-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_USUARIO (ID, USUARIO, PASSWORD, FECHACREACION)
VALUES ('4', 'Us4', 'ABC', TO_DATE('2013-09-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_USUARIO (ID, USUARIO, PASSWORD, FECHACREACION)
VALUES ('5', 'Us5', 'DFG', TO_DATE('2013-10-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_USUARIO (ID, USUARIO, PASSWORD, FECHACREACION)
VALUES ('6', 'Us6', '12222', TO_DATE('2013-11-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_USUARIO (ID, USUARIO, PASSWORD, FECHACREACION)
VALUES ('7', 'Us7', '12345', TO_DATE('2013-12-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_USUARIO (ID, USUARIO, PASSWORD, FECHACREACION)
VALUES ('8', 'Us8', 'DFFV', TO_DATE('2014-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO C_USUARIO (ID, USUARIO, PASSWORD, FECHACREACION)
VALUES ('9', 'Us9', 'AAAA', TO_DATE('2014-01-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO C_PERFIL (ID, NOMBRE, APELLIDO, PAIS, DIRECCION, C_USUARIO_ID)
VALUES ('1', 'Guillermo', 'Arana ', 'Guatemala', 'Quetzaltenango', '1');
INSERT INTO C_PERFIL (ID, NOMBRE, APELLIDO, PAIS, DIRECCION, C_USUARIO_ID)
VALUES ('2', 'Fernando', 'Higueros', 'Guatemala', 'San Marcos', '2');
INSERT INTO C_PERFIL (ID, NOMBRE, APELLIDO, PAIS, DIRECCION, C_USUARIO_ID)
VALUES ('3', 'Lucia', 'Alvarado', 'Guatemala', 'Quetzaltenango', '3');
INSERT INTO C_PERFIL (ID, NOMBRE, APELLIDO, PAIS, DIRECCION, C_USUARIO_ID)
VALUES ('4', 'Maria Cristina', 'De Leon', 'Guatemala', 'Guatemala', '4');
INSERT INTO C_PERFIL (ID, NOMBRE, APELLIDO, PAIS, DIRECCION, C_USUARIO_ID)
VALUES ('5', 'Jose', 'Alvarado', 'Guatemala', 'Guatemala', '6');
INSERT INTO C_PERFIL (ID, NOMBRE, APELLIDO, PAIS, DIRECCION, C_USUARIO_ID)
VALUES ('6', 'Angel Leonel', 'Alvarado', 'Guatemala', 'San Marcos', '7');
INSERT INTO C_PERFIL (ID, NOMBRE, APELLIDO, PAIS, DIRECCION, C_USUARIO_ID)
VALUES ('7', 'Karina', 'de Leon', 'Guatemala', 'San Marcos', '8');
INSERT INTO C_PERFIL (ID, NOMBRE, APELLIDO, PAIS, DIRECCION, C_USUARIO_ID)
VALUES ('8', 'Javier', 'Hernandez', 'Mexico', 'Mexico', '9');



INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('1', 'Articulo 1', 'Texto 1', TO_DATE('2014-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '1');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('2', 'Articulo 2', 'Texto 2', TO_DATE('2014-01-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('3', 'Articulo 3', 'Texto 3', TO_DATE('2014-02-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2', '4');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('4', 'ARticulo 4', 'Texto 4', TO_DATE('2014-03-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '4', '5');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('5', 'Articulo 5', 'Texto 5', TO_DATE('2014-03-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '4', '6');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('6', 'Articulo 6', 'Texto 6', TO_DATE('2014-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '5', '4');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('7', 'Articulo 7', 'Texto 7', TO_DATE('2014-07-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '5', '5');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('8', 'Articulo 8', 'Texto 8', TO_DATE('2014-09-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '6', '6');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('9', 'Articulo 9', 'Texto 9', TO_DATE('2014-09-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '7');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('10', 'ARticulo 10', 'Texto 10', TO_DATE('2014-10-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8', '9');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('11', 'Articulo 11', 'Texto 11', TO_DATE('2014-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '1');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('12', 'Articulo 12', 'Texto 12', TO_DATE('2015-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('13', 'Articulo 13', 'Texto 13', TO_DATE('2015-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2', '2');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('14', 'Articulo 14', 'Texto 14', TO_DATE('2015-02-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '5', '5');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('15', 'ARticulo 15', 'Texto 15', TO_DATE('2015-02-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '5', '6');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('16', 'Articulo 16', 'Text 16', TO_DATE('2015-02-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '6', '4');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('17', 'Articulo 17', 'Texto 17', TO_DATE('2015-02-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8', '8');
INSERT INTO C_ARTICULO (ID, TITULO, CONTENIDO, FECHACREACION, C_CATEGORÍA_ID, C_USUARIO_ID)
VALUES ('18', 'Articulo 18', 'Texto 18', TO_DATE('2015-03-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8', '1');



INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('1', '1', '1');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('2', '1', '2');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('3', '1', '3');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('4', '2', '1');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('5', '2', '8');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('6', '2', '16');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('7', '2', '12');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('8', '3', '1');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('9', '3', '12');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('10', '4', '3');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('11', '4', '12');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('12', '4', '17');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('13', '5', '17');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('14', '5', '12');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('15', '6', '13');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('16', '7', '14');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('17', '7', '15');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('18', '7', '16');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('19', '7', '3');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('20', '7', '2');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('21', '7', '5');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('22', '8', '18');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('23', '8', '5');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('24', '8', '6');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('25', '8', '7');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('26', '8', '9');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('27', '3', '1');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('28', '3', '2');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('29', '3', '3');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('30', '4', '7');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('31', '5', '10');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('32', '5', '11');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('33', '5', '12');
INSERT INTO C_VOTOS (ID, C_USUARIO_ID, C_ARTICULO_ID)
VALUES ('34', '6', '12');

INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('1', '/home/web/foto1', '1');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('2', '/home/web/foto1', '1');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('3', '/home/web/foto1', '1');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('4', '/home/web/foto1', '2');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('5', '/home/web/foto1', '2');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('6', '/home/web/foto1', '3');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('7', '/home/web/foto1', '3');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('8', '/home/web/foto1', '3');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('9', '/home/web/foto1', '3');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('10', '/home/web/foto1', '3');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('11', '/home/web/foto1', '3');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('12', '/home/web/foto1', '3');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('13', '/home/web/foto1', '5');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('14', '/home/web/foto1', '5');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('15', '/home/web/foto1', '5');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('16', '/home/web/foto1', '5');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('17', '/home/web/foto1', '5');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('18', '/home/web/foto1', '6');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('19', '/home/web/foto1', '7');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('20', '/home/web/foto1', '10');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('21', '/home/web/foto1', '11');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('22', '/home/web/foto1', '12');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('23', '/home/web/foto1', '13');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('24', '/home/web/foto1', '13');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('25', '/home/web/foto1', '13');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('26', '/home/web/foto1', '13');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('27', '/home/web/foto1', '13');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('28', '/home/web/foto1', '13');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('29', '/home/web/foto1', '14');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('30', '/home/web/foto1', '15');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('31', '/home/web/foto1', '15');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('32', '/home/web/foto1', '15');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('33', '/home/web/foto1', '16');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('34', '/home/web/foto1', '17');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('35', '/home/web/foto1', '18');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('36', '/home/web/foto1', '18');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('37', '/home/web/foto1', '18');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('38', '/home/web/foto1', '18');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('39', '/home/web/foto1', '18');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('40', '/home/web/foto1', '18');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('41', '/home/web/foto1', '18');
INSERT INTO C_FOTO (ID, PATH, C_ARTICULO_ID)
VALUES ('42', '/home/web/foto1', '18');

-- 1. LISTAR TODOS LAS FOTOS QUE EXISTEN.

select *
from C_Foto;

-- 2. LISTAR TODAS LAS CATEGORÍAS QUE EXISTEN.

select *
from C_Categoría;

-- 3. MOSTRAR TODOS LOS USUARIOS CON LA RESPECTIVA INFORMACIÓN DE PERFIL

select C_Usuario_id, C_Usuario.usuario, C_Usuario.fechacreacion, CP.Nombre, CP.Apellido, CP.Pais, CP.Direccion
from C_Usuario
         inner join C_Perfil CP on C_Usuario.id = CP.C_Usuario_id;

-- 4. MOSTRAR LA INFORMACIÓN DE LOS USUARIOS QUE NO TENGAN PERFIL.
#

select C_Usuario_id, C_Usuario.usuario, C_Usuario.fechacreacion, CP.Nombre, CP.Apellido, CP.Pais, CP.Direccion
from C_Usuario
         inner join C_Perfil CP on C_Usuario.id = CP.C_Usuario_id;

-- 5. MOSTRAR TODAS LAS FOTOS QUE TENGA UN ARTÍCULO DETERMINADO (Artículo 1)


select C_Foto.id, path, C_Articulo_id, CA.Titulo, CA.Contenido, CA.FechaCreacion
from C_Foto
         inner join C_Articulo CA on CA.id = C_Foto.C_Articulo_id
where Titulo = 'Artículo 1';

-- 6. MOSTRAR EL TOTAL DE ARTÍCULOS PARA UN RANGO DE FECHAS "01/08/14" al "01/02/15"

select count(*) as date_to_search
from C_Articulo
where FechaCreacion >= to_date('01-08-14', 'DD-MM-YY')
  and FechaCreacion < to_date('01-02-15', 'DD-MM-YY') + interval '1' DAY
group by FechaCreacion;

-- 7. MOSTRAR EL TOTAL DE ARTÍCULOS PUBLICADOS POR CATEGORÍA, MOSTRANDO PRIMERO LA CATEGORÍA QUE TIENE MENOS CANTIDAD DE ARTÍCULOS.

select * from C_Articulo;
-- 8. MOSTRAR LOS ARTÍCULOS CON MÁS VOTOS PRIMERO Y DE ÚLTIMO LOS QUE MENOS VOTOS TENGAN, AGREGAR INCLUSO LOS DE 0 VOTOS.

-- 9. MOSTRAR LOS USUARIOS CON EL TOTAL DE VOTOS, ORDENANDO PRIMERO LOS QUE MÁS HAN VOTADO.

select * from C_Usuario inner join C_Votos CV on C_Usuario.id = CV.C_Usuario_id

-- 10.MOSTRAR LA INFORMACIÓN DE LOS ARTÍCULOS Y QUE USUARIOS HAN VOTADO POR ELLOS

-- 11.MOSTRAR EL TOTAL DE ARTÍCULOS PUBLICADOS, POR DIA, MES y AÑO.

-- 12.MOSTRAR LA INFORMACIÓN DE LOS ARTÍCULOS Y QUE USUARIOS HAN VOTADO POR ELLOS PARA UN RANGO DE FECHAS "01/08/14" al"01/02/15"
