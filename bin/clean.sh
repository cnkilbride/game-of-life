#!/bin/bash

. setenv.sh

cd ..

mvn -f buildall.xml clean

cd bin

aws s3 rm s3://$s3_bucket/GOLBoardCalculator.jar
aws s3 rm s3://$s3_bucket/GOLBoardImageGenerator.jar
aws s3 rm s3://$s3_bucket/GOLGetSessionId.jar
aws s3 rm s3://$s3_bucket/GOLRetrieveImageLocation.jar

