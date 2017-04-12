#!/bin/bash

cd source-code || echo "missing input resource: source-code"

echo "Using MAVEN_OPTS: ${MAVEN_OPTS}"
echo "Using sonar at: ${SONAR_ADDRESS}"

mvn sonar:sonar -Dsonar.host.url=${SONAR_ADDRESS}
