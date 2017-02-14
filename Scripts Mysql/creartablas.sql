CREATE TABLE Automovil
(
    IDAutomovil     int,
    Modelo          varchar(255),
    Anio            varchar(255),
    Tipo            varchar(255),
    Precio          Float,
    Costo           Float,
    PuedeConsignar  int
)



CREATE TABLE COLOR
(
    IDColor         int,
    Nombre          varchar(255),
    Tono            varchar(255)
)



CREATE TABLE TipoProblema
(
    IDTipoProblema  int,
    Descuento       Float,
    Nombre          varchar(255),
    Nivel
)