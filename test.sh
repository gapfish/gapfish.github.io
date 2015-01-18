#!/bin/bash

schemas=`ls -1A gapfish/schemas`

for filename in $schemas
do
  jsonlint gapfish/schemas/$filename
  if [ $? != 0 ]; then exit 1; fi
  jsonlint gapfish/examples/$filename
  if [ $? != 0 ]; then exit 1; fi
  validate-schema gapfish/schemas/$filename gapfish/examples/$filename
  if [ $? != 0 ]; then exit 1; fi
done

raml-cop gapfish/gapfish.v1.raml
