CREATE DATABASE kard;

USE kard;

/*Crecion tabla Automovil*/
/*Creacion de la tabla marca*/
CREATE TABLE Marca
(
    IDMarca         int             NOT NULL        AUTO_INCREMENT,
    Nombre          varchar(255),
    Pais            varchar(255),
    PRIMARY KEY     (IDMarca)
);


CREATE TABLE Automovil
(
    IDAutomovil     int NOT NULL        AUTO_INCREMENT,
    Modelo          varchar(255),
    Anio            int,
    Tipo            varchar(255),
    Precio          Float           DEFAULT         0,
    Costo           Float           DEFAULT         0,
    PuedeConsignar  int,
    IDMarca         int,
    PRIMARY KEY     (IDAutomovil),
    FOREIGN KEY     (IDMarca)       REFERENCES      Marca       (IDMarca)
);

/*Creacion tabla color*/
CREATE TABLE Color
(
    IDColor         int             NOT NULL        AUTO_INCREMENT,
    Nombre          varchar(255),
    Tono            varchar(255),
    PRIMARY KEY     (IDColor)
);


/*Creacion tabla color automovil
esta representa la relacion N <-> M (Muchos a muchos)
entre la tabla color y automovil*/
CREATE TABLE ColorAutomovil
(
    IDColor         int             NOT NULL,
    IDAutomovil     int             NOT NULL,
    PRIMARY KEY     (IDColor,IDAutomovil),
    FOREIGN KEY     (IDColor)       REFERENCES      Color       (IDColor),
    FOREIGN KEY     (IDAutomovil)   REFERENCES      Automovil   (IDAutomovil)
);

/*Creacion de la tabla tipo problema*/
CREATE TABLE TipoProblema
(
    IDTipoProblema  int             NOT NULL        AUTO_INCREMENT,
    Descuento       Float,
    Nombre          varchar(255),
    Nivel           int,
    PRIMARY KEY     (IDTipoProblema)
);

/*Creacion tabla Problema automovil
esta representa la relacion N <-> M (Muchos a muchos)
entre la tabla tipo problema y automovil*/
CREATE TABLE ProblemaAutomovil
(
    IDTipoProblema  int                     NOT NULL,
    IDAutomovil     int                     NOT NULL,
    Cantidad        int                     DEFAULT        1,
    PRIMARY KEY     (IDTipoProblema,IDAutomovil),
    FOREIGN KEY     (IDTipoProblema)        REFERENCES      TipoProblema        (IDTipoProblema),
    FOREIGN KEY     (IDAutomovil)           REFERENCES      Automovil           (IDAutomovil)
);

CREATE TRIGGER PrecioAutomovil
BEFORE INSERT 
ON Automovil
FOR EACH ROW SET NEW.Precio = NEW.Costo;

CREATE TRIGGER AplicaDescuento
    AFTER INSERT ON ProblemaAutomovil
    FOR EACH ROW
        UPDATE Automovil as a
        SET Precio = Precio - (
            (
                SELECT TipoProblema.Descuento from TipoProblema
                WHERE ( NEW.IDTipoProblema = TipoProblema.IDTipoProblema)
            ) * NEW.Cantidad
        )
        WHERE a.IDAutomovil = NEW.IDAutomovil;


