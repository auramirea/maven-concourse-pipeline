
# Static code analysis

## Purpose
Pipeline for performing static code analysis via the sonar maven plugin and uploading the results to a SonarQube server.


## Setup
Run docker-compose up in the master branch to launch SonarQube on port 9000.

## Run the pipeline
fly -t plan1 sp -p job-static-analysis -c ../maven-concourse-pipeline/pipeline.yml -l credentials.yml

If the job succeeds, the sonar analysis should be visible in the SonarQube UI.

