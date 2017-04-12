#!/bin/bash

echo "Generating maven settings.xml"
./pipeline/tasks/generate-settings.sh

cd source-code

echo "Using MAVEN_OPTS: ${MAVEN_OPTS}"
echo "Using sonar at: ${SONAR_ADDRESS}"

mvn sonar:sonar -Dsonar.host.url=${SONAR_ADDRESS}

