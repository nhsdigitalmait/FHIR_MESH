#!/bin/bash
#
#
if [[ "$1" == "--version" ]]
then
docker-compose -f docker-compose_fhir_mesh.yml run --rm tkw_fhir_mesh $1
	exit 0
else
	if [[ "$1" == "-d" ]]
	then
	docker-compose -f docker-compose_fhir_mesh.yml up -d
	else
		docker-compose -f docker-compose_fhir_mesh.yml up
	fi
fi
