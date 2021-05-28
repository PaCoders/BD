/* ==================================================================================================
   //////////////////////////////////////////////////////////////////////////////////////////////////
   ////////////////////////EXAMEN JUNIO 2019 PRÁCTICAS BASES DE DATOS////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////////////
   ==================================================================================================
  
   ==================================================================================================
                                    CREACIÓN DE LAS TABLAS
   ==================================================================================================
    !! PARA PODER USAR LA BASE DE DATOS RECORDAD CAMBIAR A LA BASE DE DATOS VUESTRA !!
    use BD2x_uxxxxx

    SI QUEREMOS USAR ESTAS TABLAS, DEBEMOS ELIMINAR ANTES LAS TABLAS EXISTENTES
*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE questionnaire, questionnaire_taken, user;

CREATE TABLE articles (
    id int(11) NOT NULL AUTO_INCREMENT,
    title varchar(45) NOT NULL,
    text text NOT NULL,
    date date NOT NULL,
    Topics_id int(11) NOT NULL,
    Authors_id int(11) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (Authors_id) REFERENCES authors (id),
    FOREIGN KEY (Topics_id) REFERENCES topics (id)
);
CREATE TABLE authors (
    id int(11) NOT NULL AUTO_INCREMENT,
    surname varchar(45) NOT NULL,
    name varchar(45) NOT NULL,
    email varchar(45) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE revisions (
    Articles_id int(11) NOT NULL,
    Authors_id int(11) NOT NULL,
    PRIMARY KEY (Articles_id, Authors_id),
    FOREIGN KEY (Articles_id) REFERENCES articles (id),
    FOREIGN KEY (Authors_id) REFERENCES authors (id);
);
CREATE TABLE topics (
    id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(45) NOT NULL,
    PRIMARY KEY (id)
);

/* INSERTAMOS ALGUNOS DATOS PARA PODER MOSTRAR RESULTADOS */

INSERT INTO Topics(id,name) VALUES
(1,"Videojuegos"),
(2,"Tecnología"),
(3,"Social"),
(4,"Psicología");

INSERT INTO Authors(id,surname,name,email) VALUES
(1,),
(2,),
(3,),
(4,);

INSERT INTO Articles(id,tilte,text,date,Topics_id,Authors_id) VALUES
(),
(),
(),
();

INSERT INTO Revisions(Articles_id,Authors_id) VALUES
(),
(),
(),
();