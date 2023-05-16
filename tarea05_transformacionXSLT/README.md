## TAREA05 - LMSGI

La tarea consiste en escribir una transformación **XSLT** que a partir de un fichero **XML** con datos de artistas genere una página web con una tabla con los datos de los artistas.

El elemento raíz del fichero es ``artistas``. Dentro de este elemento hay uno o más elementos artista, como se puede ver en el ejemplo. Todos los elementos y atributos son **Obligatorios**, salvo el elemento **fallecimiento**.

### **Ejemplo:**
``artistasej.xml``
```xml
<?xml version="1.0" encoding="UTF-8"?>
<artistas>
    <artista cod="a101">
        <nombreCompleto>Diego Velázquez</nombreCompleto>
        <nacimiento>1599</nacimiento>
        <fallecimiento>1660</fallecimiento>
        <pais>España</pais>
        <fichaCompleta>https://es.wikipedia.org/wiki/Diego_Vel%C3%A1zquez</fichaCompleta>
    </artista>
    <artista cod="a102">
        <nombreCompleto>Michelangelo Caravaggio</nombreCompleto>
        <nacimiento>1571</nacimiento>
        <pais>Italia</pais>
        <fichaCompleta>https://es.wikipedia.org/wiki/Caravaggio</fichaCompleta>
    </artista>
    <artista cod="a103">
        <nombreCompleto>Herrada de Landsberg</nombreCompleto>
        <nacimiento>1125</nacimiento>
        <fallecimiento>1195</fallecimiento>
        <pais>Alsacia</pais>
        <fichaCompleta> https://es.wikipedia.org/wiki/Herrada_de_Landsberg</fichaCompleta>
    </artista>
    <artista cod="a104">
        <nombreCompleto>Francisco de Goya</nombreCompleto>
        <nacimiento>1746</nacimiento>
        <fallecimiento>1828</fallecimiento>
        <pais>España</pais>
        <fichaCompleta>https://es.wikipedia.org/wiki/Francisco_de_Goya</fichaCompleta>
    </artista>
</artistas>
```

Al aplicar la transformación, el resultado debe ser una **página web válida**. Es decir, tiene que tener todos los elementos básicos de una página web: título, codificación de caracteres, elementos, html, body y head.

Dentro del **cuerpo de la página** habrá una tabla, obtenida a partir de los datos del fichero ``artistas.xml``.
* La tabla tendrá una fila por cada **artista mostrado**, y una primera fila como como cabecera, con los nombres: Código, Nombre, Año de nacimiento, Año de fallecimiento, País y Página web.
* Como se puede ver en el fichero, el **año de fallecimiento** no está disponible para todos los artistas. En ese caso, en la columna correspondiente se mostrará el texto “Desconocido”.
* En la última columna, el valor se obtiene del elemento **fichaCompleta**. Debe mostrarse un vínculo a la dirección adecuada, con el texto “Saber más”.
* Sólo se mostrarán los **artistas nacidos despúes de 1500**.
* Los artistas se mostrarán **ordenados por año** de nacimiento creciente. Es decir, en la primera fila, el que tenga un año de nacimiento anterior.

### **Ejemplo:**
Para el fichero ``artistasej.xml`` se obtendrá una página web con este aspecto:

<br>
<div align = center><img src="https://github.com/AlbaGonzalezPereira/daw_LMSGI/blob/main/tarea05_transformacionXSLT/img/tablaArtistas.PNG" alt="Tabla artistas" style = "width: 60%"></div>
<br>

Y este **código**:
```html
<html>
    <head>
        <meta charset="UTF-8"/>
        <title>Tabla de artistas</title>
    </head>
    <body>
        <table>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Año de nacimiento</th>
                <th>Año de fallecimiento</th>
                <th>País</th>
                <th>Página web</th>
            </tr>
            <tr>
                <td>a102</td>
                <td>Michelangelo Caravaggio</td>
                <td>1571</td>
                <td>Desconocido</td>
                <td>Italia</td>
                <td>
                    <a target="blank" href="https://es.wikipedia.org/wiki/Caravaggio">Saber más</a>
                </td>
            </tr>
            <tr>
                <td>a101</td>
                <td>Diego Velázquez</td>
                <td>1599</td>
                <td>1660</td>
                <td>España</td>
                <td>
                    <a target="blank" href="https://es.wikipedia.org/wiki/Diego_Vel%C3%A1zquez">Saber más</a>
                </td>
            </tr>
            <tr>
                <td>a104</td>
                <td>Francisco de Goya</td>
                <td>1746</td>
                <td>1828</td>
                <td>España</td>
                <td>
                    <a target="blank" href="https://es.wikipedia.org/wiki/Francisco_de_Goya">Saber más</a>
                </td>
            </tr>
        </table>
    </body>
</html>
```

### **Indicaciones para la entrega:**

Se entregarán **dos ficheros**, sin comprimir.
1. La transformación se entregará en un fichero con nombre ``tarea5.xslt``
2. También se entregara un fichero  en el que se expliquen las decisiones tomadas para realizar la transformación. Este fichero se llamará ``documentacion.pdf``, y tiene que ser formato **PDF**.




