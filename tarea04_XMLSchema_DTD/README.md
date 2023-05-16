## TAREA04 - LMSGI
Esta tarea consta de **dos ejercicios**.
1. Una empresa utiliza ficheros XML para realizar el inventario, entre otras cosas, de impresoras. Para cada impresora se quiere guardar su número de serie, marca, modelo, peso, tamaños de papel con los que puede trabajar, el cartucho que usa, el tipo, el año de compra y si está en red o no.

    Un ejemplo de estos ficheros sería:
    ```xml
    <impresoras>
        <impresora numSerie="i245" tipo="láser" compra="2010">
            <marca>Epson</marca>
            <modelo>EPL300</modelo>
            <peso>4.52</peso>
            <tamano>A4</tamano>
            <tamano>A5</tamano>
            <cartucho>C-123BV</cartucho>
            <enred/>
        </impresora>
        <impresora numSerie="i246" tipo="matricial">
            <marca>HP</marca>
            <modelo>LaserJet 2410</modelo>
            <peso>3.2</peso>
            <tamano>A4</tamano>
            <cartucho>C-456P</cartucho>
        </impresora>
    </impresoras>
    ```
Escribe un **XML Schema** para estos ficheros, eligiendo los tipos de datos más apropiados, con el nombre ``impresoras.xsd`` y teniendo en cuenta que:
- El **peso** es un número positivo y no puede tener más de dos decimales.
- Puede haber más de un **tamaño**.
- El atributo **tipo** sólo puede tomar los valores ‘***matricial***’, ‘***láser***’ y ‘***tinta***’. Es obligatorio.
- El atributo **numSerie** es obligatorio y hace de identificador.
- El **cartucho** está formado por una C mayúscula, un guión, tres números y una o dos letras mayúsculas.
- Todos los elementos son **obligatorios**, menos enred.
- El elemento **enred** es opcional. De estar presente, es un elemento vacío.
- El atributo **compra**, opcional, guarda el ***año de compra***. Es un número entero positivo.
- En cada fichero hay datos para **una o más impresoras**.

### **Resultado:**
```xsd
<?xml version="1.0" encoding="UTF-8"?> <!-- Esta siempre tiene que ser la primera línea en los documentos XML-->

<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
	<xs:element name="impresoras">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="impresora" maxOccurs="unbounded">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="marca" type="xs:string" />
							<xs:element name="modelo" type="xs:string" /> 
                            <xs:element name="peso">
                                <xs:simpleType> 
							        <xs:restriction base="xs:decimal"> 
							            <xs:fractionDigits value="2"/>
							            <xs:minInclusive value="0"/>
							        </xs:restriction> 
					                </xs:simpleType>
                            </xs:element>
				            <xs:element name="tamano" type="xs:string" maxOccurs="unbounded" /> <!-- maxOccurs="unbounded" indica que puede haber varios tamaños -->				
                            <xs:element name="cartucho">
                                <xs:simpleType>
                                    <xs:restriction base="xs:string"> 
                                        <xs:pattern value="C-[0-9]{3}[A-Z]{1,2}"/>
                                    </xs:restriction>
                                </xs:simpleType>
                            </xs:element>
				            <xs:element name="enred" minOccurs="0" maxOccurs="1" />
			            </xs:sequence>
				        <xs:attribute name="numSerie" type="xs:ID" /> <!-- Al ser un identificador se indica con xs:ID -->
				        <xs:attribute name="tipo" use="required">
					        <xs:simpleType>
                                <xs:restriction base="xs:string">
                                    <xs:enumeration value="matricial" />
                                    <xs:enumeration value="láser" />
                                    <xs:enumeration value="tinta" />
                                </xs:restriction>  
					        </xs:simpleType>
				        </xs:attribute>	
				        <xs:attribute name="compra" type="xs:int" />
					</xs:complexType>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
</xs:schema>					
```


2. Un asociación de jugadores de mus utiliza ficheros XML para almacenar la información de los torneos que organiza. Para cada torneo se quiere guardar el año en que se realizó, el anterior ganador (su id) y la información de los participantes. De los participantes se quiere almacenar su identificador, el de su pareja, su nombre completo, edad, país y también si es cabeza de serie o no.

    Un **ejemplo** de estos ficheros sería:

    ```xml
    <torneo edicion="2021" anteriorGanador="j01">
        <participante idP="j01" pareja="j02">
            <nombre>Manuel Pérez</nombre>
            <edad>23</edad>
            <pais>España</pais>
            <cabezaDeSerie/>
        </participante>
        <participante idP="j02" pareja="j01">
            <nombre>Manuel Gómez</nombre>
            <edad>25</edad>
            <pais>España</pais>
        </participante>
        <participante idP="j03" pareja="j04">
            <nombre>Ana Puertas</nombre>
            <edad>22</edad>
            <pais> E5spaña</pais>
            <cabezaDeSerie/>
        </participante>
        <participante idP="j04" pareja="j03">
            <nombre>Paco Fraile</nombre>
            <edad>45</edad>
            <pais>España</pais>
        </participante>
    </torneo>
     ```
Escribe un **DTD** adecuado para estos ficheros, con el nombre ``torneo.dtd`` y teniendo en cuenta que:
- Todos los atributos son **obligatorios**.
- El atributo **idP** hace de identificador.
- El atributo **pareja** es el identificador de otro participante que forzosamente debe estar presente en el fichero.
- El elemento **cabezaDeSerie** es **opcional**, los demás son obligatorios.
- En cada fichero hay datos para **un solo torneo**.
- El torneo tiene que tener **participantes**.

### **Resultado:**
```xml
<!ELEMENT torneo (participante)+>
<!ATTLIST edicion NMTOKEN #REQUIRED>
<!ATTLIST anteriorGanador NMTOKEN #REQUIRED>

<!ELEMENT participante (nombre,edad,pais,cabezaDeSerie?)>
<!ATTLIST idP ID NMTOKEN #REQUIRED>
<!ATTLIST pareja IDREF #REQUIRED>
<!ELEMENT nombre (#PCDATA)#REQUIRED>
<!ELEMENT edad (#PCDATA)#REQUIRED>
<!ELEMENT pais (#PCDATA)#REQUIRED>
<!ELEMENT cabezaDeSerie CDATA #FIXED "" #IMPLIED>
```

Si se desea **incluir el DTD** en el mismo documento ``torneo.xml``, quedaría así:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE torneo [ 
<!ELEMENT torneo (participante)+>
      <!ATTLIST torneo edicion NMTOKEN #REQUIRED> <!-- Hay que ponerle el nombre del elemento al que pertenece el atributo, en este caso torneo -->
      <!ATTLIST torneo anteriorGanador NMTOKEN #REQUIRED> 

<!ELEMENT participante (nombre,edad,pais,cabezaDeSerie?)>
<!ATTLIST participante idP ID  #REQUIRED> 
<!ATTLIST participante pareja IDREF #REQUIRED> 
<!ELEMENT nombre (#PCDATA) >
<!ELEMENT edad (#PCDATA)> 
<!ELEMENT pais (#PCDATA)> 
<!ELEMENT cabezaDeSerie EMPTY>
]>

<torneo edicion="2021" anteriorGanador="j01">
  <participante idP="j01" pareja="j02">
    <nombre>Manuel Pérez</nombre>
    <edad>23</edad>
    <pais>España</pais>
    <cabezaDeSerie/>
  </participante>
  <participante idP="j02" pareja="j01">
    <nombre>Manuel Gómez</nombre>  
    <edad>25</edad>
    <pais>España</pais>
  </participante>
  <participante idP="j03" pareja="j04">
    <nombre>Ana Puertas</nombre>
    <edad>22</edad>
    <pais> E5spaña</pais>
    <cabezaDeSerie/>
  </participante>
  <participante idP="j04" pareja="j03">
    <nombre>Paco Fraile</nombre>  
    <edad>45</edad>
    <pais>España</pais>
  </participante>
</torneo>
```