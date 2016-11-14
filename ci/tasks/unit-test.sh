#!/bin/bash
set -e -x
# added by Ravi Jag

mvn -f pcf-ers-demo/pom.xml clean test
