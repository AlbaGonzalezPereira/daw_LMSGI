<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
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
             <!-- Vamos a poner que para cada artista nos haga un listado -->
            <xsl:for-each select="artistas/artista">
            
                <!-- establecemos que nos ordene artistas por fecha de nacimiento--> 
                <xsl:sort select="nacimiento"/> <!-- por defecto es ascendente --> 
                <!-- establecemos que saque los artistas con fecha de nacimiento > 1500 -->
                <xsl:if test="nacimiento>'1500'">
                    <tr>
                      <td><xsl:value-of select="@cod"/></td>
                      <td><xsl:value-of select="nombreCompleto"/></td>
                      <td><xsl:value-of select="nacimiento"/></td>
                      <td>
                      <xsl:choose>
                        <!-- establecemos fallecimiento a "Desconocido"-->
                        <xsl:when test="not(fallecimiento)">
                            Desconocido
                        </xsl:when>
                        <xsl:otherwise>
                            <!--en caso de no ser desconocido que ponga la fecha de fallecimiento-->
                            <xsl:value-of select="fallecimiento"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      </td>
                      <td><xsl:value-of select="pais"/></td>
                      <td>
                        <!-- establecemos enlaces a "Saber más"-->
                        <a target="blank">
                        <xsl:attribute name="href">
                            <xsl:value-of select="fichaCompleta"/>
                        </xsl:attribute>Saber más
                        </a>
                       </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
