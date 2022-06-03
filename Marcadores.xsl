<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output version="5.0" method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/marcadores">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
                <link rel="stylesheet" type="text/css" href="Marcadores.css"/>
            </head>
            <body>
                <section class="container-fluid">
                    <article class="row">
                        <div class="col-6">
                            <h1><xsl:value-of select="titulo"/></h1>
                        </div>
                        <div class="col-3">
                            <h2>Autor: <xsl:value-of select="@autor"/></h2>
                        </div>
                        <div class="col-3">
                            <h3><xsl:value-of select="pagina[2]/url"/></h3>
                        </div>
                    </article>
                    <table class="table table-striped" >
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>URL</th>
                                <th>Año</th>
                                <th>Tipo de página</th>
                                <th>Correo</th>
                            </tr>
                        </thead>
                        <tbody>
                        <xsl:for-each select="pagina">
                            <xsl:sort select="url/@fuente" order="descending"/>
                            <tr>
                                <td><xsl:value-of select="nombre"/></td>
                                <td><xsl:value-of select="descripcion"/></td>
                                <td><xsl:value-of select="url"/> - <xsl:value-of select="url/@fuente"/> </td>
                                <td>
                                    <!--<xsl:if test="año &lt; 2022 ">
                                    <xsl:value-of select="año"/>
                                    </xsl:if> -->
                                    <xsl:choose>
                                        <xsl:when test="año = 2000"><p style="color:blue"><xsl:value-of select="año"/></p></xsl:when>
                                        <xsl:when test="año = 2005"><p style="color:red"><xsl:value-of select="año"/></p></xsl:when>
                                        <xsl:when test="año = 2022"><p style="color:green"><xsl:value-of select="año"/></p></xsl:when>
                                        <xsl:otherwise>No existe año</xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <td><xsl:value-of select="tipo_pagina"/></td>
                                <td><xsl:value-of select="correo"/></td>
                            </tr>
                        </xsl:for-each>
                        </tbody>
                    </table>
                </section>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>