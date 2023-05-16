## TAREA01 - LMSGI
**Ejercicio 2**.- Diseñar un documento válido en XML, con el nombre ``ejercicio2.xml``, que permita
estructurar la información de una agenda de teléfonos, suponer que la información que podemos tener
de una persona es su nombre y apellidos, su dirección y sus teléfonos, que pueden ser el teléfono de
casa, el móvil y el teléfono del trabajo.

**Código**:
```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!DOCTYPE agenda >
<agenda>
	<persona>
	<nombre>Alba</nombre>
	<apellidos>Gonzalez Pereira</apellidos>
	<direccion>Illa de Man</direccion>
	<poblacion>Pontevedra</poblacion>
	<provincia>Pontevedra</provincia>
	<telefonos>
		<telefono tipo = "movil">678876655</telefono>
		<telefono tipo = "casa">986889000</telefono>
		<telefono tipo = "trabajo">986456655</telefono>
	</telefonos>
	</persona>
</agenda>
```

**Ejercicio 3**.- Diseñar un documento válido en XML, con el nombre ``ejercicio3.xml``, que permita estructurar la información de las recetas de cocina de un restaurante y aplicarlo a la siguiente receta de cocina. Hay que hacerlo de modo que un sistema informático pueda realizar ***búsquedas por ingredientes***, ***cantidad de comensales*** o ***nombre de la receta***.

Sopa de cebolla (4 personas)

Ingredientes:
- 1 Kg. de cebollas.
- 2 l. de caldo de carne.
- 100 gr. mantequilla.
- 1 cucharada de harina.
- 100 gr. de queso emmental suizo o gruyére rallado.
- Pan tostado en rebanadas.
- Tomillo.
- 1 hoja de laurel.
- Pimienta.

Proceso:
- Pelar y partir las cebollas en rodajas finas.
- Rehogarlas con la mantequilla, sal y pimienta a fuego lento hasta que estén transparentes sin dorarse.
- Añadir la harina sin dejar de remover.
- Ponerlo en una cazuela con el caldo, el tomillo y el laurel.
- Dejar cocer a fuego lento durante unos 15 minutos.
- Poner las rebanadas de pan encima, espolvorear el queso y gratinar al horno.

**Código**:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<recetas>
   <receta comensales="4 personas">
      <nombre>Sopa de cebolla </nombre>
		<ingredientes>
			<ingrediente cantidad="1" unidad="kg">cebollas</ingrediente>
			<ingrediente cantidad="2" unidad="l">caldo de carne</ingrediente>
			<ingrediente cantidad="100" unidad="gr">mantequilla</ingrediente>
			<ingrediente cantidad="2" unidad="l">caldo de carne</ingrediente>
			<ingrediente cantidad="1" unidad="cucharada">harina</ingrediente>
			<ingrediente cantidad="100" unidad="gr">queso emmental suizo o gruyére rallado</ingrediente>
			<ingrediente cantidad="varias" unidad="rebanadas">pan tostado</ingrediente>
			<ingrediente cantidad="" unidad="">tomillo</ingrediente>
			<ingrediente cantidad="1" unidad="hoja">laurel</ingrediente>
			<ingrediente cantidad="" unidad="">pimienta</ingrediente>
		</ingredientes>
   
        <proceso>
            <paso>Pelar y partir las cebollas en rodajas finas.</paso>
            <paso>Rehogarlas con la mantequilla, sal y pimienta a fuego lento hasta que estén transparentes sin dorarse.</paso>
            <paso>Añadir la harina sin dejar de remover.</paso>
		    <paso>Ponerlo en una cazuela con el caldo, el tomillo y el laurel.</paso>
		     <paso>Dejar cocer a fuego lento durante unos 15 minutos.</paso>
		    <paso>Poner las rebanadas de pan encima, espolvorear el queso y gratinar al horno.</paso>
        </proceso>
	</receta>
</recetas>
```

**Ejercicio 4**.- Diseñar un documento XML válido, con el nombre ``ejercicio4.xml``, que permita estructurar la
información para permitir su gestión informática de los alumnos de un modulo del ciclo formativo DAM. Aplicarlo al módulo de Lenguajes de Marcas y Sistemas de Gestión de Información sabiendo que tiene asignadas 4 horas semanales y es de carácter obligatorio. El modulo se imparte entre el 15 de septiembre de 2010 y el 30 de junio de 2011. Hay matriculados dos alumnos:
* Ana Fernández Gutiérrez, con nif 16965696L, teléfono 789654321, email ana.fdezgtrrez@hotmail.com, su dirección es C/ El Percebe, 13 de Santander CP 39302. No hay información sobre las faltas de asistencia o sus notas hasta el momento.
* Pepito Grillo, con nif 98765432H, teléfono 656566555, email yhyh@yahoo.com, su dirección es Avd. El Pez, 5 de Suances CP 39401. Su nota es "apto" y no tiene faltas de
asistencia

Código:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<ciclos_formativos>
  <ciclo nombre ="daw" horas_semanales="4h" caracter="obligatorio" matriculados="2">
    <fecha_imparticion>
        <inicio>15 de septiembre de 2010</inicio>
        <fin>30 de junio de 2011</fin>
    </fecha_imparticion>
    <alumnos>
        <alumno>
            <nombre>Ana</nombre>
            <apellidos>Fernández Gutiérrez</apellidos>
            <nif>16965696L</nif>
            <telefono>789654321</telefono>
            <email>ana.fdezgtrrez@hotmail.com</email>
            <direccion>C/ El Percebe, 13</direccion>
            <poblacion>Santander</poblacion>
            <cp>39302</cp>
            <nota></nota>
            <faltas_asistencia></faltas_asistencia>
        </alumno>
        <alumno>
            <nombre>Pepito</nombre>
            <apellidos>Grillo</apellidos>
            <nif>98765432H</nif>
            <telefono>656566555</telefono>
            <email>yhyh@yahoo.com</email>
            <direccion>Avd. El Pez, 5</direccion>
            <poblacion>Suances</poblacion>
            <cp>39401</cp>
            <nota>apto</nota>
            <faltas_asistencia>0</faltas_asistencia>
        </alumno>
    </alumnos>  
  </ciclo>
</ciclos_formativos>
```