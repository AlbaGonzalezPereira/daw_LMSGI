(: 1. Modelo de las impresoras de tipo “láser” :)
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/@tipo="láser"
return <impresora><modelo>{data($x/modelo)}</modelo></impresora>
(: return <impresora>{$x/modelo}</impresora> :),

(: 2. Marca y modelo de las impresoras con más de un tamaño :)
for $x in doc("impresoras.xml")/impresoras/impresora
where count($x/tamaño)>1
return <impresora><marca>{data($x/marca)}</marca><modelo>{data($x/modelo)}</modelo></impresora>
(: return <impresora>{$x/marca,$x/modelo}</impresora> :),

(: 3. Marca y modelo de las impresoras con tamaño A3 (pueden tener otros) :)
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/tamaño="A3"
return <impresora><marca>{data($x/marca)}</marca><modelo>{data($x/modelo)}</modelo></impresora>
(: return <impresora>{$x/marca,$x/modelo}</impresora> :),

(: 4. Marca y modelo de las impresoras con tamaño A3 como único tamaño :)
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/tamaño="A3" and count($x/tamaño)=1
return <impresora><marca>{data($x/marca)}</marca><modelo>{data($x/modelo)}</modelo></impresora>
(: return <impresora>{$x/marca,$x/modelo}</impresora> :),

(: 5. Modelo de las impresoras en red :)
for $x in doc("impresoras.xml")/impresoras/impresora
where exists($x/enred)
return <impresora><modelo>{data($x/modelo)}</modelo></impresora>
(: return <impresora>{$x/modelo}</impresora> :)






