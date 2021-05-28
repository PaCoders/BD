/* ==================================================================================================
   //////////////////////////////////////////////////////////////////////////////////////////////////
   ////////////////////////EXAMEN SEPTIEMBRE 2019 PRÁCTICAS BASES DE DATOS///////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////////////
   ==================================================================================================
  
   ==================================================================================================
                                    CREACIÓN DE LAS TABLAS
   ==================================================================================================
    !! PARA PODER USAR LA BASE DE DATOS RECORDAD CAMBIAR A LA BASE DE DATOS VUESTRA !!
    use BD2x_uxxxxx

    SI QUEREMOS USAR ESTAS TABLAS, DEBEMOS ELIMINAR ANTES LAS TABLAS EXISTENTES
*/

SET FOREIGN_KEY_CHECKS = 0; /* Eliminamos las restricciones de las claves foráneas para poder eliminar lo que tengamos */
/* DROP TABLE nombre_de_tabla; Orden que utilizaremos para vaciar la base de datos */
CREATE TABLE user (
    username varchar(50),
    password varchar(128) NOT NULL,
    email varchar(254) NOT NULL UNIQUE,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    country varchar(50),
    birth_date date,
    gender varchar(1) NOT NULL,
    PRIMARY KEY (username)
);
CREATE TABLE group (
    name varchar(30),
    description varchar(100),
    owner varchar(50) NOT NULL,
    PRIMARY KEY (name),
    FOREIGN KEY (owner) REFERENCES user (username)
);
CREATE TABLE user_group (
    username varchar(50) NOT NULL,
    group_name varchar(30) NOT NULL,
    PRIMARY KEY (username, group_name),
    FOREIGN KEY (username) REFERENCES user (username),
    FOREIGN KEY (group_name) REFERENCES group (name)
);
CREATE TABLE questionnaire (
    name varchar(128) NOT NULL UNIQUE,
    questions varchar(4096) NOT NULL,
    date_added date NOT NULL,
    PRIMARY KEY (name)
);
CREATE TABLE questionnaire_taken (
    id integer,
    date_taken datetime NOT NULL,
    questionnaire_name varchar(128) NOT NULL,
    username varchar(50) NOT NULL,
    answers varchar(2048) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (questionnaire_name) REFERENCES questionnaire (name),
    FOREIGN KEY (username) REFERENCES user (username)
);
/* INSERTAMOS ALGUNOS DATOS PARA PODER MOSTRAR RESULTADOS */
INSERT INTO user(username,password,email,first_name,last_name,country,birth_date,gender) VALUES
("paquito_el_chocolatero","papasfritasconhuevo","paquito@outlook.es","Francisco","Rodríguez","España",19910501,"v"),
("Shuu_Naty_97","misamigosmifamilia","shu_natY_97@hotmail.com","Natalia","García","España",19970611,"m"),
("xXGuilleCodXx","vegetaeselmejo","guillermo2000@gmail.com","Guillermo","Sánchez","España",20000402,"v"),
("JungHoseok","btslosmejores","elsa.1213@gmail.com","Elsa","Smith","Noruega",19990719,"m");

INSERT INTO group(name,description,owner) VALUES
("quedadas","Grupo de quedadas","Shuu_Naty_97"),
("fans","Grupo de fans","JungHoseok");

INSERT INTO user_group(username,group_name) VALUES
("paquito_el_chocolatero","quedadas"),
("fans","xXGuilleCodXx");

INSERT INTO questionnaire(name,questions,date_added) VALUES
("Cuestionario sobre el uso del bolígrafo","1. ¿Usted usa el bolígrafo? ",20200510),
("Tiempo de uso de los teléfonos","1. ¿Utiliza mucho el teléfono? 2. ¿Cuánto tiempo lo usa aproximadamente?",20190202),
("Test sobre el deporte","1. ¿Realiza mucho ejercicio?",CURDATE()); /* Obtenemos la fecha actual del sistema */

INSERT INTO questionnaire_taken(id,date_taken,questionnaire_name,username,answers) VALUES
(NULL,CURDATE(),"Test sobre el deporte","paquito_el_chocolatero","Mister ejercicios me llaman"),
(NULL,20210105,"Tiempo de uso de los teléfonos","Shuu_Naty-97","Tu sabe segun el dia"),
(NULL,20201212,"Cuestionario sobre el uso del bolígrafo","JunHoseok","For study, I used to use too much."),
(NULL,2020,"Tiempo de uso de los teléfonos","JunHoseok","I don't use mobile phone except when I'm bored in my room");

/*
   ==================================================================================================
                                    CONSULTAS RESUELTAS DEL EXAMEN
   ==================================================================================================


*/