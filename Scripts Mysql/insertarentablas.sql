/*Nota: Los datos insertados, no son necesariamente reales*/

USE kard;

/*
Tabla Marca

CREATE TABLE Marca
(
    IDMarca         int             NOT NULL,
    Nombre          varchar(255),
    Pais            varchar(255),
    PRIMARY KEY     (IDMarca)
);
*/


INSERT  INTO 
Marca   (Nombre, Pais)
VALUES  ('BMW','Alemania');

INSERT  INTO 
Marca   (Nombre, Pais)
VALUES  ('Form','Estados unidos');

INSERT  INTO 
Marca   (Nombre, Pais)
VALUES  ('Suzuki','Japon');

INSERT  INTO 
Marca   (Nombre, Pais)
VALUES  ('Tesla','Estados unidos');

/*
Tabla Automovil
CREATE TABLE Automovil
(
    IDAutomovil     int             NOT NULL        AUTO_INCREMENT,
    Modelo          varchar(255),
    Anio            int,
    Tipo            varchar(255),
    Precio          Float           DEFAULT         0,
    Costo           Float           DEFAULT         0,
    PuedeConsignar  int             DEFAULT         1,
    IDMarca         int,
    PRIMARY KEY     (IDAutomovil),
    FOREIGN KEY     (IDMarca)       REFERENCES      Marca       (IDMarca)
);

*/

/*Insertar autos de la marca Ford*/

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('Focus','2017', "Estandar", 104000,
(select     IDMarca from Marca where(Nombre = 'Form'))
);

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('Kuga','2016', "Automatico", 250000,
(select     IDMarca from Marca where(Nombre = 'Form'))
);

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('Mondeo','2017', "Estandar", 300000,
(select     IDMarca from Marca where(Nombre = 'Form'))
);

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('Seria 3','2017', "Estandar", 754000,
(select     IDMarca from Marca where(Nombre = 'BMW'))
);

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('X3','2016', "Automatico", 2500000,
(select     IDMarca from Marca where(Nombre = 'BMW'))
);

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('XI','2017', "Automatico", 1300000,
(select     IDMarca from Marca where(Nombre = 'BMW'))
);




/*Insertar autos de la marca Suzuki*/

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('Vitara','2015', "Estandar", 404000,
(select     IDMarca from Marca where(Nombre = 'Suzuki'))
);

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('Swift','2016', "Automatico", 750000,
(select     IDMarca from Marca where(Nombre = 'Suzuki'))
);

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('Jimmy','2017', "Estandar", 50000,
(select     IDMarca from Marca where(Nombre = 'Suzuki'))
);




/*Automoviles de la marca Tesla*/

INSERT  INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('Model S','2014', "Automatico", 1000000,
    (
            select     IDMarca from Marca where(Nombre = 'Tesla')
    )
);

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('Model X','2015', "Automatico", 1400000,
(
    select     IDMarca from Marca where(Nombre = 'Tesla'))
);

INSERT      INTO 
Automovil   (Modelo, Anio, Tipo, Costo, IDMarca)
VALUES      ('Model 3','2016', "Automatico", 1700000,
(
    select     IDMarca from Marca where(Nombre = 'Tesla'))
);

/*
tabla color
CREATE TABLE Color
(
    IDColor         int             NOT NULL        AUTO_INCREMENT,
    Nombre          varchar(255),
    Tono            varchar(255),
    PRIMARY KEY     (IDColor)
);
*/

INSERT      INTO 
Color       (Nombre, Tono)
VALUES      ('Negro','#000000');

INSERT      INTO 
Color       (Nombre, Tono)
VALUES      ('Plata','#8a9597');

INSERT      INTO 
Color       (Nombre, Tono)
VALUES      ('Rojo','#CD5C5C');

INSERT      INTO 
Color       (Nombre, Tono)
VALUES      ('Blanco','#ffffff');

/*
Tabla Color Automovil

CREATE TABLE ColorAutomovil
(
    IDColor         int             NOT NULL,
    IDAutomovil     int             NOT NULL,
    PRIMARY KEY     (IDColor,IDAutomovil),
    FOREIGN KEY     (IDColor)       REFERENCES      Color       (IDColor),
    FOREIGN KEY     (IDAutomovil)   REFERENCES      Automovil   (IDAutomovil)
);
*/

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Blanco')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Kuga'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Rojo')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Kuga'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Kuga'))
);

/**/

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Blanco')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Focus'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Plata')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Focus'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Focus'))
);

/**/

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Plata')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Mondeo'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Mondeo'))
);

/**/

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Plata')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Seria 3'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Seria 3'))
);

/**/

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Plata')),
    (select    IDAutomovil from Automovil  where(Modelo = 'X3'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'X3'))
);

/**/

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Plata')),
    (select    IDAutomovil from Automovil  where(Modelo = 'XI'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'XI'))
);


INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Blanco')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Vitara'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Vitara'))
);



INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Blanco')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Swift'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Swift'))
);


INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Plata')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Jimmy'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Jimmy'))
);

/**/

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Plata')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Model S'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Model S'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Rojo')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Model S'))
);

/**/

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Plata')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Model X'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Model X'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Rojo')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Model X'))
);


/**/

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Plata')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Model 3'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Negro')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Model 3'))
);

INSERT          INTO 
ColorAutomovil  (IDColor, IDAutomovil)
VALUES          
(
    (select    IDColor     from Color      where(Nombre = 'Rojo')),
    (select    IDAutomovil from Automovil  where(Modelo = 'Model 3'))
);

/*
Tabla Tipo problema

CREATE TABLE TipoProblema
(
    IDTipoProblema  int             NOT NULL        AUTO_INCREMENT,
    Descuento       Float,
    Nombre          varchar(255),
    Nivel           int,
    PRIMARY KEY     (IDTipoProblema)
);
*/

INSERT          INTO 
TipoProblema    (Descuento, Nombre, Nivel)
VALUES          (600,"Rayon",0);

INSERT          INTO 
TipoProblema    (Descuento, Nombre, Nivel)
VALUES          (10000,"Frenos",0);

INSERT          INTO 
TipoProblema    (Descuento, Nombre, Nivel)
VALUES          (10000,"Luces",0);

INSERT          INTO 
TipoProblema    (Descuento, Nombre, Nivel)
VALUES          (10000,"Direccion hidraulica",0);

INSERT          INTO 
TipoProblema    (Descuento, Nombre, Nivel)
VALUES          (0,"Condicion error",1);

/*
Tabla problema automovil

CREATE TABLE ProblemaAutomovil
(
    IDTipoProblema  int                     NOT NULL,
    IDAutomovil     int                     NOT NULL,
    Cantidad        int                     DEFAULT         1,
    PRIMARY KEY     (IDTipoProblema,IDAutomovil),
    FOREIGN KEY     (IDTipoProblema)        REFERENCES      TipoProblema        (IDTipoProblema),
    FOREIGN KEY     (IDAutomovil)           REFERENCES      Automovil           (IDAutomovil)
);
*/

/*Creamos una promesa*/
DECLARE @IDautoActual int;

SET @IDautoActual := (select  IDAutomovil      from Automovil      where(Modelo = 'Kuga' and (
        (select    IDColor      from Color          where(Nombre = 'Blanco'))
    )));


INSERT                  INTO 
ProblemaAutomovil       (IDTipoProblema, IDAutomovil, Cantidad)
VALUES          
(
    (select    IDTipoProblema   from TipoProblema   where(Nombre = 'Rayon')),
    @IDautoActual,
    10
);



SET @IDautoActual :=     (select    IDAutomovil      from Automovil      where(Modelo = 'Kuga' and (
        (select    IDColor      from Color          where(Nombre = 'Rojo'))
    )));

INSERT                  INTO 
ProblemaAutomovil       (IDTipoProblema, IDAutomovil)
VALUES          
(
    (select    IDTipoProblema   from TipoProblema   where(Nombre = 'Frenos')),
    @IDautoActual
);


/**/

SET @IDautoActual :=     (select    IDAutomovil      from Automovil      where(Modelo = 'Focus' and (
        (select    IDColor      from Color          where(Nombre = 'Plata'))
    )));


INSERT                  INTO 
ProblemaAutomovil       (IDTipoProblema, IDAutomovil, Cantidad)
VALUES          
(
    (select    IDTipoProblema   from TipoProblema   where(Nombre = 'Rayon')),
    @IDautoActual,
    7
);

SET @IDautoActual :=      (select    IDAutomovil      from Automovil      where(Modelo = 'Focus' and (
        (select    IDColor      from Color          where(Nombre = 'Blanco'))
    )));

INSERT                  INTO 
ProblemaAutomovil       (IDTipoProblema, IDAutomovil)
VALUES          
(
    (select    IDTipoProblema   from TipoProblema   where(Nombre = 'Luces')),
    @IDautoActual

);

/**/

SET @IDautoActual :=   (select    IDAutomovil      from Automovil      where(Modelo = 'Focus' and (
        (select    IDColor      from Color          where(Nombre = 'Plata'))
    )));

INSERT                  INTO 
ProblemaAutomovil       (IDTipoProblema, IDAutomovil, Cantidad)
VALUES          
(
    (select    IDTipoProblema   from TipoProblema   where(Nombre = 'Direccion hidraulica')),
    @IDautoActual
);

SET @IDautoActual :=  (select    IDAutomovil      from Automovil      where(Modelo = 'Mondeo' and (
        (select    IDColor      from Color          where(Nombre = 'Negro'))
    )));

INSERT                  INTO 
ProblemaAutomovil       (IDTipoProblema, IDAutomovil)
VALUES          
(
    (select    IDTipoProblema   from TipoProblema   where(Nombre = 'Luces')),
    @IDautoActual
);

/**/

SET @IDautoActual :=      (select    IDAutomovil      from Automovil      where(Modelo = 'Seria 3' and (
        (select    IDColor      from Color          where(Nombre = 'Negro'))
    )));

INSERT                  INTO 
ProblemaAutomovil       (IDTipoProblema, IDAutomovil)
VALUES          
(
    (select    IDTipoProblema   from TipoProblema   where(Nombre = 'Frenos')),
    @IDautoActual
);

/**/

