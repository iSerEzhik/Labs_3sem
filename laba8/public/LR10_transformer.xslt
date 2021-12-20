<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <xsl:apply-templates/>
      </body>
      <script>
        Array.from(document.querySelectorAll('td')).forEach((elem)=>{if (elem.textContent.includes('iterate')){
        elem.textContent = elem.textContent.substr('iterate'.length)
        }
        })
      </script>
    </html>
  </xsl:template>
  <xsl:template match="result">
    <p>Результат вычисления:<B><xsl:value-of select="."/></B></p>
  </xsl:template>
  <xsl:template match="iterates">
    <table>
      <tr>
        <th style="text-align:left">№ Итерации</th>
        <th style="text-align:left">Значение</th>
      </tr>
        <xsl:apply-templates/>
    </table>
  </xsl:template>
  <xsl:template match="iterates/*">
    <tr>
      <td><xsl:value-of select="name()"/></td>
      <td><xsl:value-of select="."/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>

