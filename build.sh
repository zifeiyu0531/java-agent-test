#!/bin/bash

# download pinpoint and unzip
wget -O MseAgent.tar.gz https://github.com/pinpoint-apm/pinpoint/releases/download/v2.3.3/pinpoint-agent-2.3.3.tar.gz
tar -zxvf MseAgent.tar.gz

# modify content
mv pinpoint-agent-2.3.3 MseAgent
rm -rf MseAgent/plugin/*

# build with maven
mvn -B package --file pom.xml

# add plugin
mv polaris-agent-adapter/pinpoint/pinpoint-dubbo2-plugin/output/pinpoint-dubbo2-plugin-1.0.0-SNAPSHOT-jar-with-dependencies.jar MseAgent/plugin/
mv polaris-agent-adapter/pinpoint/pinpoint-spring-cloud-2021-plugin/output/pinpoint-spring-cloud-2021-plugin-1.0.0-SNAPSHOT-jar-with-dependencies.jar MseAgent/plugin/

# zip
zip -r MseAgent.zip MseAgent



