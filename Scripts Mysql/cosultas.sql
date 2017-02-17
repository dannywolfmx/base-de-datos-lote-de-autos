

USE kard;

/*
    Realice una consulta en donde se especifique el tipo de carro
    a tratar, año, color y defectos para mostrar el precio
    final que tendra el cliente y la ganancia para la empresa.
*/


Select      Marca.Nombre,
            Automovil.Modelo, 
            GROUP_CONCAT( DISTINCT Automovil.Tipo) Tipo, 
            Automovil.Anio, 
            GROUP_CONCAT(DISTINCT Color.Nombre) Colores,
            Automovil.Precio

from        Automovil
INNER JOIN  Marca
ON          (Marca.IDMarca = Automovil.IDMarca)
INNER JOIN  ColorAutomovil 
ON          (Automovil.IDAutomovil = ColorAutomovil.IDAutomovil)
INNER JOIN  Color 
ON          (Color.IDColor = ColorAutomovil.IDColor)
GROUP BY    Automovil.Modelo
;

/*
    Crear un listado de los automoviles que presentan la misma
    falla bajo una misma marca
*/


Select      Marca.Nombre,
            GROUP_CONCAT(Automovil.Modelo) Automovil,
            TipoProblema.Nombre

from        Automovil
INNER JOIN  Marca
ON          (Marca.IDMarca = Automovil.IDMarca)
INNER JOIN  ProblemaAutomovil 
ON          (Automovil.IDAutomovil = ProblemaAutomovil.IDAutomovil)
INNER JOIN  TipoProblema 
ON          (TipoProblema.IDTipoProblema = ProblemaAutomovil.IDTipoProblema)
GROUP BY    TipoProblema.Nombre,Marca.Nombre
;

/*
    Muestre el listado de automoviles con sus caracteristicas
    (modelo, marca, año, color, precio e imperfecciones (Si las tiene))
*/

Select      Automovil.IDAutomovil,
            Marca.Nombre,
            Automovil.Modelo, 
            Automovil.anio, 
            GROUP_CONCAT(DISTINCT Color.Nombre) Colores,
            Automovil.Precio,
            Automovil.Costo,
            IFNULL(GROUP_CONCAT(TipoProblema.Nombre),'No tiene problemas') Problema

from        Automovil
INNER JOIN  Marca
ON          (Marca.IDMarca = Automovil.IDMarca)
INNER JOIN  ColorAutomovil 
ON          (Automovil.IDAutomovil = ColorAutomovil.IDAutomovil)
INNER JOIN  Color 
ON          (Color.IDColor = ColorAutomovil.IDColor)
LEFT JOIN  ProblemaAutomovil 
ON          (Automovil.IDAutomovil = ProblemaAutomovil.IDAutomovil)
LEFT JOIN  TipoProblema 
ON          (TipoProblema.IDTipoProblema = ProblemaAutomovil.IDTipoProblema)
GROUP BY    Automovil.IDAutomovil
;