<?xml version="1.0" encoding="UTF-8"?>
<!--
This file is part of de.robertkosten.tools. de.robertkosten.tools is
free software: you can redistribute it and/or modify it under the terms of
the GNU General Public License as published by the Free Software Foundation,
either version 3 of the License, or (at your option) any later version.
de.robertkosten.tools is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License for more details. You should have received a copy of the GNU
General Public License along with de.robertkosten.tools. If not, see
<http://www.gnu.org/licenses/>.

I suggest calling this with:
xsltproc -o dir/ ep2svg.xsl input.ep

@author Robert Kosten
-->
<xsl:stylesheet version="1.0" extension-element-prefixes="exsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg" xmlns:p="http://www.evolus.vn/Namespace/Pencil" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xul="http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:exsl="http://exslt.org/common">
    <xsl:output omit-xml-declaration="yes" />
    <xsl:strip-space elements="p:Document p:Pages p:Page"/>

    <xi:include href="includes/tools.xsl" />

    <xsl:template match="/p:Document">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="p:Pages">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="p:Page">
        <exsl:document href="{p:Properties/p:Property[@name='name']}.svg" method="xml" version="1.0" encoding="utf-8" doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg+xml">
            <svg version="1.1">
                <xsl:apply-templates />
            </svg>
        </exsl:document>
    </xsl:template>

    <xsl:template match="p:Content">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="*[namespace-uri() != 'http://www.evolus.vn/Namespace/Pencil']">
        <xsl:copy>
            <xsl:copy-of select="@*[namespace-uri() != 'http://www.evolus.vn/Namespace/Pencil']" />
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*">
        <!-- Void -->
    </xsl:template>

</xsl:stylesheet>
