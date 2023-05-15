## TAREA06 - LMSGI

**A partir del fichero ``artistas.xml``, escribe **consultas XQuery** que devuelvan:**
1. Nombre y país de todos los artistas.
```XQuery
(:1. Nombre y país de todos los artistas:)
for $x in doc("artistas.xml")/artistas/artista
return <artista>{$x/nombreCompleto, $x/pais}</artista>,
```

2. El nombre (sin etiquetas) de los artistas que nacieron antes de 1500.
```XQuery
(:2. El nombre (sin etiquetas) de los artistas que nacieron antes de 1500.:)
for $x in doc("artistas.xml")/artistas/artista
where number($x/nacimiento)<1500
return data($x/nombreCompleto),
```

3. Nombre de los artistas para los que no hay año de fallecimiento.
```XQuery
(:3. Nombre de los artistas para los que no hay año de fallecimiento.:)
for $x in doc("artistas.xml")/artistas/artista
where not($x/fallecimiento)
return <artista>{$x/nombreCompleto}</artista>,
```

4. Una lista HTML con el nombre de los artistas nacidos en España.
```XQuery
(:4. Una lista HTML con el nombre de los artistas nacidos en España.:)
<ul>
{
for $x in doc("artistas.xml")/artistas/artista
where $x/pais="España"
return <li>{data($x/nombreCompleto)}</li>
}
</ul>,
```

5. El número de artistas nacidos antes de 1600.
```XQuery
(:5. El número de artistas nacidos antes de 1600.:)
count(for $x in doc("artistas.xml")/artistas/artista
where number($x/nacimiento)<1600
return $x),
```
---
**A partir del fichero ``impresoras.xml``, escribe **consultas XQuery** que devuelvan:**

1. Modelo de las impresoras de tipo “láser".
```XQuery
(:1. Modelo de las impresoras de tipo “láser”.:)
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/@tipo="láser"
return <impresora><modelo>{data($x/modelo)}</modelo></impresora>,
(:return <impresora>{$x/modelo}</impresora>:)
```

2. Marca y modelo de las impresoras con más de un tamaño.
```XQuery
(:2. Marca y modelo de las impresoras con más de un tamaño.:)
for $x in doc("impresoras.xml")/impresoras/impresora
where count($x/tamaño)>1
return <impresora><marca>{data($x/marca)}</marca><modelo>{data($x/modelo)}</modelo></impresora>,
(:return <impresora>{$x/marca,$x/modelo}</impresora>:)
```

3. Marca y modelo de las impresoras con tamaño A3 (pueden tener otros).
```XQuery
(:3. Marca y modelo de las impresoras con tamaño A3 (pueden tener otros).:)
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/tamaño="A3"
return <impresora><marca>{data($x/marca)}</marca><modelo>{data($x/modelo)}</modelo></impresora>,
(:return <impresora>{$x/marca,$x/modelo}</impresora>:)
```

4. Marca y modelo de las impresoras con tamaño A3 como único tamaño.
```XQuery
(:4. Marca y modelo de las impresoras con tamaño A3 como único tamaño.:)
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/tamaño="A3" and count($x/tamaño)=1
return <impresora><marca>{data($x/marca)}</marca><modelo>{data($x/modelo)}</modelo></impresora>,
(:return <impresora>{$x/marca,$x/modelo}</impresora>:)
```
5. Modelo de las impresoras en red.
```XQuery
(:5. 5. Modelo de las impresoras en red.:)
for $x in doc("impresoras.xml")/impresoras/impresora
where exists($x/enred)
return <impresora><modelo>{data($x/modelo)}</modelo></impresora>
(:return <impresora>{$x/modelo}</impresora>:)
```