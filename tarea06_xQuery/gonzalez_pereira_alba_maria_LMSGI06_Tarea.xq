(: 1. Nombre y país de todos los artistas :)
for $x in doc("artistas.xml")/artistas/artista
return <artista>{$x/nombreCompleto, $x/pais}</artista>,

(: 2. El nombre (sin etiquetas) de los artistas que nacieron antes de 1500 :)
for $x in doc("artistas.xml")/artistas/artista
where number($x/nacimiento)<1500
return data($x/nombreCompleto),

(: 3. Nombre de los artistas para los que no hay año de fallecimiento :)
for $x in doc("artistas.xml")/artistas/artista
where not($x/fallecimiento)
return <artista>{$x/nombreCompleto}</artista>,

(: 4. Una lista HTML con el nombre de los artistas nacidos en España :)
<ul>
{
for $x in doc("artistas.xml")/artistas/artista
where $x/pais="España"
return <li>{data($x/nombreCompleto)}</li>
}
</ul>,

(: 5. El número de artistas nacidos antes de 1600 :)
count(for $x in doc("artistas.xml")/artistas/artista
where number($x/nacimiento)<1600
return $x)



