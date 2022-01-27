#!/bin/bash

# download pinpoint and unzip
wget -O PolarisAgent.tar.gz https://github.com/pinpoint-apm/pinpoint/releases/download/v2.3.3/pinpoint-agent-2.3.3.tar.gz
tar -zxvf PolarisAgent.tar.gz

# modify content
mv pinpoint-agent-2.3.3 PolarisAgent
rm -rf PolarisAgent/plugin/*

# build with maven
mvn -B package --file pom.xml

# add plugin
mv target/* PolarisAgent/plugin/

# zip
zip -r PolarisAgent.zip PolarisAgent
