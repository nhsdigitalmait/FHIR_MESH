#Report the version numbers
if [[ -e /home/service/TKW/config/FHIR_MESH/version_string.txt ]]
then
	cat /home/service/TKW/config/FHIR_MESH/version_string.txt
fi
java -jar /home/service/TKW/TKW-x.jar -version | grep -v "starting on"

if [ "$1" == '--version' ]
then
	exit 0
fi

echo "Running as UID $UID"

echo "Making sure output structure is available"

cd /home/service/data
tar -xvf /home/service/TKW/config/FHIR_MESH/tkwoutputstructure.tar

# set the external properties folder
export EXT_CONFIG_ROOT="/home/service/config"
echo External properties directory: $EXT_CONFIG_ROOT
cd /home/service
# decide whether its TLSMA or not

	#ClearText
	java -version
#	java -jar /home/service/TKW/TKW-x.jar -meshinterceptor /home/service/TKW/config/FHIR_MESH/tkw-x.properties
	
	java -XX:+UseContainerSupport -XX:MaxRAMPercentage=80.0 -jar /home/service/TKW/TKW-x.jar -meshinterceptor /home/service/TKW/config/FHIR_MESH/tkw-x.properties
