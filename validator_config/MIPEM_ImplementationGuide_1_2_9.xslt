<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fhir="http://hl7.org/fhir" xpath-default-namespace="http://hl7.org/fhir">
	<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<p style="color:#000000">
			<b>IMPLEMENTATION GUIDE OUTPUT</b>
		</p>
		<p style="color:#000000">
			Source: Digital Medicines 1.2.9-Private-Beta
		</p>
		<table border="0">
			<!--Minor Illness Consultation Composition.type changed to 1577041000000109, Community Pharmacist Consultation Service for minor illness-->
			<xsl:variable name="resource" select="'Composition'"/>
			<xsl:variable name="element" select="'type'"/>
			<xsl:variable name="value" select="/Bundle//Bundle//Composition/type/coding/code/@value"/>
			<xsl:variable name="expected" select="'1577041000000109'"/>
			<xsl:variable name="result" select="$value = $expected"/>
			<xsl:call-template name="OutputResult">
				<xsl:with-param name="pcardinality" select="''"/>
				<xsl:with-param name="pelement" select="concat($resource,'.',$element)"/>
				<xsl:with-param name="pvalue" select="$value"/>
				<xsl:with-param name="presult" select="$result"/>
				<xsl:with-param name="ptext" select="''"/>
				<xsl:with-param name="pexpected" select="$expected"/>
			</xsl:call-template>
			<!-- Encounter -->
			<!--Encounter.DateTime of Contact-->
			<xsl:for-each select="//resource/Encounter">
				<xsl:variable name="resource" select="./name()"/>
				<xsl:variable name="index" select="./position()"/>
				<xsl:variable name="element" select="'contact_time'"/>

				<xsl:variable name="value" select="./period/start/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'MANDATORY'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--Encounter.Service-->
				<xsl:variable name="element" select="'Service'"/>
				<xsl:variable name="value" select="./serviceProvider/reference/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--Encounter.OrganizationName-->
				<xsl:variable name="element" select="'Organisation reference'"/>
				<xsl:variable name="value" select="./serviceProvider/reference/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--Encounter.ClinicianName-->
				<xsl:variable name="element" select="'Participant reference'"/>
				<xsl:variable name="value" select="./participant/individual/reference/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="//resource/Organization">
				<!--Organization-->
				<!--identifier - REQUIRED - uniquely identifies this medication dispense (UUID)-->
				<xsl:variable name="resource" select="'Organization'"/>
				<xsl:variable name="index" select="./position()"/>
				<xsl:variable name="element" select="'Practice identifier'"/>
				<xsl:variable name="value" select="./identifier/value/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'MANDATORY'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
			</xsl:for-each>
			<!--MedicationDispense-->
			<xsl:for-each select="//resource/MedicationDispense">
				<!--identifier - REQUIRED - uniquely identifies this medication dispense (UUID)-->
				<xsl:variable name="resource" select="'MedicationDispense'"/>
				<xsl:variable name="index" select="./position()"/>
				<xsl:variable name="element" select="'id'"/>
				<xsl:variable name="value" select="./id/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--status - REQUIRED - should always be completed-->
				<xsl:variable name="element" select="'status'"/>
				<xsl:variable name="value" select="./status/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--medicationReference (name) - MANDATORY - a reference to the medication which was dispensed-->
				<xsl:variable name="element" select="'medicationReference'"/>
				<xsl:variable name="value" select="./medicationReference/reference/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'MANDATORY'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--medicationReference.Medication.form - REQUIRED - the form of the medication e.g. capsule, drops, tablet, lotion etc.-->
				<xsl:variable name="element" select="'medicationReference.Medication.form'"/>
				<xsl:variable name="value" select="./medicationReference/display/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--subject - REQUIRED - a reference to the patient-->
				<xsl:variable name="element" select="'subject'"/>
				<xsl:variable name="value" select="./subject/reference/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--context - OPTIONAL - reference to the encounter in which the medication was dispensed (the pharmacy visit)-->
				<xsl:variable name="element" select="'context'"/>
				<xsl:variable name="value" select="./context/reference/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'OPTIONAL'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--performer - REQUIRED - who / what dispensed the medication-->
				<xsl:variable name="element" select="'performer'"/>
				<xsl:variable name="value" select="./performer/actor/reference/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--type - REQUIRED - the type dispense/supply (SNOMED CT concept)-->
				<xsl:variable name="element" select="'type'"/>
				<xsl:variable name="value" select="./type/coding/code/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--quantity - MANDATORY - amount dispensed expressed as it’s unit form dose, e.g. tablet, ml, gram-->
				<xsl:variable name="element" select="'quantity'"/>
				<xsl:variable name="value1" select="./quantity/extension[@url='https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-MedicationQuantityText-1']/valueString/@value"/>
				<xsl:variable name="value2" select="./quantity/value/@value"/>
				<xsl:variable name="value3" select="./quantity/unit/@value"/>
				<xsl:variable name="value" select="concat('Value: ',$value2,', Unit: ',$value3,', Extension:',$value1)"/>
				<xsl:variable name="result" select="$value2 and (string-length($value2) &gt; 0) and $value3 and (string-length($value3) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--daysSupply - MANDATORY - amount supplied expressed as a number of days-->
				<xsl:variable name="element" select="'daysSupply'"/>
				<xsl:variable name="value" select="./daysSupply/value/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'MANDATORY'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--whenHandedOver - REQUIRED - the date/time on which the medication was supplied to the patient-->
				<xsl:variable name="element" select="'whenHandedOver'"/>
				<xsl:variable name="value" select="./whenHandedOver/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--dosageInstruction.route - REQUIRED - the route by which the medication is administered e.g. oral, IM, IV-->
				<xsl:variable name="element" select="'dosageInstruction.route'"/>
				<xsl:variable name="value" select="./dosageInstruction/route/coding/code/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--dosageInstruction.site - REQUIRED - the anatomical site at which the medication is to be administered-->
				<xsl:variable name="element" select="'dosageInstruction.site'"/>
				<xsl:variable name="value" select="./dosageInstruction/site/coding/code/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--dosageInstruction.doseQuantity - REQUIRED - a structural representation of dose amount, e.g. 20mg or 2 tablets-->
				<xsl:variable name="element" select="'dosageInstruction.doseQuantity'"/>
				<xsl:variable name="value" select="./dosageInstruction/dose/doseQuantity/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--dosageInstruction.timing - REQUIRED - a structural, computable representation of dose timing-->
				<xsl:variable name="element" select="'dosageInstruction.timing'"/>
				<xsl:variable name="value" select="./dosageInstruction/timing/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--dosageInstruction.text - MANDATORY - the entire medication dosage and administration directions including dose quantity and medication frequency and optionally duration e.g. “1 tablet at night” or “2mg at 10pm”-->
				<xsl:variable name="element" select="'dosageInstruction.text'"/>
				<xsl:variable name="value" select="./dosageInstruction/text/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'MANDATORY'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
				<!--dosageInstruction.additionalInstructions - REQUIRED - additional instructions, requirements for adherence support-->
				<xsl:variable name="element" select="'dosageInstruction.additionalInstruction'"/>
				<xsl:variable name="value" select="./dosageInstruction/additionalInstruction/coding/code/@value"/>
				<xsl:variable name="result" select="$value and (string-length($value) &gt; 0)"/>
				<xsl:call-template name="OutputResult">
					<xsl:with-param name="pcardinality" select="'REQUIRED'"/>
					<xsl:with-param name="pelement" select="concat($resource,'[',$index, '].',$element)"/>
					<xsl:with-param name="pvalue" select="$value"/>
					<xsl:with-param name="presult" select="$result"/>
					<xsl:with-param name="ptext" select="''"/>
					<xsl:with-param name="pexpected" select="''"/>
				</xsl:call-template>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:template name="OutputResult">
		<xsl:param name="pcardinality"/>
		<!-- Mandatory or required  -->
		<xsl:param name="pelement"/>
		<xsl:param name="pvalue"/>
		<!-- Name of the Field to be validated -->
		<xsl:param name="presult"/>
		<xsl:param name="ptext"/>
		<!-- Name of the Field to be validated -->
		<xsl:param name="pexpected"/>
		<xsl:choose>
			<xsl:when test="$presult">
				<tr>
					<td style="color:#008000">
						<xsl:text>PASS </xsl:text>
						<xsl:value-of select="$pcardinality"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$pelement"/>
						<xsl:text> is present, with value '</xsl:text>
						<xsl:value-of select="$pvalue"/>
						<xsl:value-of select="$ptext"/>
						<xsl:text>'.</xsl:text>
					</td>
				</tr>
			</xsl:when>
			<xsl:when test="not($presult)">
				<xsl:choose>
					<xsl:when test="$pcardinality = ''">
						<tr>
							<td style="color:#900000">
								<xsl:text>ERROR </xsl:text>
								<xsl:value-of select="$pelement"/>
								<xsl:text> is incorrect, actual value: '</xsl:text>
								<xsl:value-of select="$ptext"/>
								<xsl:text>' expected value: '</xsl:text>
								<xsl:value-of select="$pexpected"/>
								<xsl:text>'</xsl:text>
							</td>
						</tr>
					</xsl:when>
					<xsl:when test="$pcardinality = 'MANDATORY'">
						<tr>
							<td style="color:#900000">
								<xsl:text>ERROR </xsl:text>
								<xsl:value-of select="$pcardinality"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="$pelement"/>
								<xsl:text> is not present</xsl:text>
								<xsl:value-of select="$ptext"/>
							</td>
						</tr>
					</xsl:when>
					<xsl:when test="$pcardinality = 'MANDATORY'">
						<tr>
							<td style="color:#900000">
								<xsl:text>ERROR </xsl:text>
								<xsl:value-of select="$pcardinality"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="$pelement"/>
								<xsl:text> is not present</xsl:text>
								<xsl:value-of select="$ptext"/>
							</td>
						</tr>
					</xsl:when>
					<xsl:when test="$pcardinality = 'REQUIRED'">
						<tr>
							<td style="color:#DF8719">
								<xsl:text>WARNING </xsl:text>
								<xsl:value-of select="$pcardinality"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="$pelement"/>
								<xsl:text> is not present</xsl:text>
								<xsl:value-of select="$ptext"/>
							</td>
						</tr>
					</xsl:when>
					<xsl:when test="$pcardinality = 'OPTIONAL'">
						<tr>
							<td style="color:#DF8719">
								<xsl:text>INFORMATION </xsl:text>
								<xsl:value-of select="$pcardinality"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="$pelement"/>
								<xsl:text> is not present</xsl:text>
								<xsl:value-of select="$ptext"/>
							</td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
