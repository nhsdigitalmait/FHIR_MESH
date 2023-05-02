<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xpath-default-namespace="http://hl7.org/fhir">
	<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<table border="0">
			<xsl:variable name="Resource_Name" select="//Immunization"/>
			<xsl:for-each select="$Resource_Name">
				<xsl:variable name="Imm_Code" select="./extension[@url='https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-VaccinationProcedure-1']/valueCodeableConcept/coding/code/@value"/>
				<xsl:variable name="notGiven" select="./notGiven/@value"/>
				<xsl:variable name="lotNumber" select="./lotNumber/@value"/>
				<xsl:variable name="expirationDate" select="./expirationDate/@value"/>
				<xsl:choose>
					<xsl:when test="$Imm_Code = '1324681000000101' or '1324691000000104' or '1240491000000103'">
						<tr>
							<td style="color:#008000">
								<xsl:text>--COVID SNOMED CODE PRESENT--</xsl:text>
								<xsl:text> ImmCode: </xsl:text>
								<xsl:value-of select="$Imm_Code"/>
								<xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="$notGiven">
										<xsl:text>Not Given: </xsl:text>
										<xsl:value-of select="$notGiven"/>
										<xsl:text>
						</xsl:text>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="$lotNumber">
										<xsl:text>lotNumber: </xsl:text>
										<xsl:value-of select="$lotNumber"/>
										<xsl:text>
						</xsl:text>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="$expirationDate">
										<xsl:text>expirationDate: </xsl:text>
										<xsl:value-of select="$expirationDate"/>
										<xsl:text>
						</xsl:text>
									</xsl:when>
								</xsl:choose>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<!--NOT A COVID IMM-->
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
