#!/bin/bash

set -ex

source ./pipeline/tasks/common.sh

VERSION=$(build_version "./version" "number" "./source-code" $BRANCH)
echo "Version to build: ${VERSION}"

echo "Generating maven settings.xml"
./pipeline/tasks/generate-settings.sh

cd source-code

echo "Setting maven with version to build"
mvn versions:set -DnewVersion=${VERSION}


set +e

mvn install

status=$?

if [[ ! -d target/surefire-reports ]]; then
  exit $status
fi

mvn assembly:single

cp target/* ../build

ls -l ../build

exit $status
