#/bin/bash
configDirectory=$PWD
if [ -z "$1" ]
  then
	echo "No config directory supplied. Assuming '" $configDirectory "' as config directory."
  else
    configDirectory=$1
fi

# Update all instances of local dir with docker image directories for all config/contrib entries
sed -i -e 's|TKW_ROOT/|/home/service/TKW/|g' ${configDirectory}/tkw-x.properties

# Update all output directories with docker image volume directories
sed -i -e "/^tks.evidencemetadata.location/c\tks.evidencemetadata.location /home/service/data/all_evidence" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.validator.reports/c\tks.validator.reports /home/service/data/validator_reports" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.logdir/c\tks.logdir /home/service/data/logs" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.savedmessages/c\tks.savedmessages /home/service/data/all_evidence" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.sender.destination/c\tks.sender.destination /home/service/data/transmitter_sent_messages" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.spine.sds.reference/c\tks.spine.sds.reference /home/service/external_configuration/siab-test-sds-ref_AutoTester.xml" ${configDirectory}/tkw-x.properties

# Update FHIR profile directory with docker image volume directories 
sed -i -e "/^tks.validator.hapifhirvalidator.assetdir.ignore/c\tks.validator.hapifhirvalidator.assetdir.ignore /home/service/fhir/examples/" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.validator.hapifhirvalidator.assetdir /c\tks.validator.hapifhirvalidator.assetdir /home/service/fhir" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.validator.hapifhirvalidator.profileversionfilelocation/c\tks.validator.hapifhirvalidator.profileversionfilelocation /home/service/fhir/package.json" ${configDirectory}/tkw-x.properties

# Update FHIR_MESH ruleset with docker image directories
sed -i -e "/^tks.MeshTransport.namelist/c\tks.MeshTransport.namelist MESHMAIL001 MESHMAIL002" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.MeshTransport.MESHMAIL001.class/c\tks.MeshTransport.MESHMAIL001.class	uk.nhs.digital.mait.tkwx.meshinterceptor.MeshInterceptHandler" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.MeshTransport.MESHMAIL001.in/c\tks.MeshTransport.MESHMAIL001.in /home/service/MESH/MESHMAIL001/IN" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.MeshTransport.MESHMAIL001.out/c\tks.MeshTransport.MESHMAIL001.out /home/service/MESH/MESHMAIL001/OUT" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.MeshTransport.MESHMAIL001.forwarder/c\tks.MeshTransport.MESHMAIL001.forwarder /home/service/MESH/MESHMAIL001/forwarder" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.MeshTransport.MESHMAIL001.sent/c\tks.MeshTransport.MESHMAIL001.sent /home/service/MESH/MESHMAIL001/SENT" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.MeshTransport.MESHMAIL002.class/c\tks.MeshTransport.MESHMAIL002.class	uk.nhs.digital.mait.tkwx.meshinterceptor.MeshInterceptHandler" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.MeshTransport.MESHMAIL002.in/c\tks.MeshTransport.MESHMAIL002.in /home/service/MESH/MESHMAIL002/IN" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.MeshTransport.MESHMAIL002.out/c\tks.MeshTransport.MESHMAIL002.out /home/service/MESH/MESHMAIL002/OUT" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.MeshTransport.MESHMAIL002.forwarder/c\tks.MeshTransport.MESHMAIL002.forwarder /home/service/MESH/MESHMAIL002/forwarder" ${configDirectory}/tkw-x.properties
sed -i -e "/^tks.MeshTransport.MESHMAIL002.sent/c\tks.MeshTransport.MESHMAIL002.sent /home/service/MESH/MESHMAIL002/SENT" ${configDirectory}/tkw-x.properties



sed -i -e 's|TKW_ROOT/|/home/service/TKW/|g' ${configDirectory}/simulator_config/test_tks_rule_config.txt
# Update Validator ruleset with docker image directories
sed -i -e 's|TKW_ROOT/|/home/service/TKW/|g' ${configDirectory}/validator_config/validator.conf
