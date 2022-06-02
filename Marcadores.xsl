<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
            </head>
            <body>
                <h2>Marcadores</h2>
                <h3><xsl:value-of select="/marcadores/titulo"></xsl:value-of></h3>
                <h3><xsl:value-of select="/marcadores/pagina[0]/nombre"></xsl:value-of></h3>
                <table border="1">
                    <tr>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>URL</th>
                        <th>Tipo de página</th>
                        <th>Año</th>
                        <xsl:for-each select="/marcadores/pagina">
                            <xsl:sort select="año" order="descending"/>
                            <tr>
                                <td><xsl:value-of select="nombre"></xsl:value-of></td>
                                <td><xsl:value-of select="descripcion"></xsl:value-of></td>
                                <td><xsl:value-of select="url"></xsl:value-of></td>
                                <td><xsl:value-of select="tipo_pagina"></xsl:value-of></td>
                                <td>
                                    <!--<xsl:if test="año &gt; 100">
                                        <div style="color:red"><xsl:value-of select="año"/></div>
                                    </xsl:if> -->
                                    <xsl:choose>
                                        <xsl:when test="año = 2000 "><div style="color:green"><xsl:value-of select="año"/></div></xsl:when>
                                        <xsl:otherwise><div style="color:blue"><xsl:value-of select="año"/></div></xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tr>
                </table>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>