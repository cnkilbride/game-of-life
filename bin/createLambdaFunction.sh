#!/bin/bash

functionName=$1
sourceName=$2
handler=$3
description=$4

echo "-------------------------------------------------------------------------------"
echo "Creating lambda function $functionName"
echo "-------------------------------------------------------------------------------"

. setenv.sh

aws lambda delete-function --function-name $functionName

aws s3 cp ../$sourceName/target/$sourceName-*.jar s3://$s3_bucket/$functionName.jar

aws lambda create-function \
                    --function-name $functionName \
                    --runtime java8 \
                    --role `getRoleArn` \
                    --handler $handler \
                    --code "S3Bucket=$s3_bucket,S3Key=$functionName.jar" \
                    --description "$description" \
                    --timeout 60 \
                    --memory-size 512 \
                    --publish

