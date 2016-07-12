#!/bin/bash

echo "-------------------------------------------------------------------------------"
echo "Creating lambda functions"
echo "-------------------------------------------------------------------------------"

. setenv.sh

cd ..

mvn -f buildall.xml install

cd bin

./createLambdaFunction.sh GOLBoardCalculator \
        BoardCalculator \
        com.balistra.gameoflife.BoardCalculator \
        "Game of Life - Calculate Board Content"

./createLambdaFunction.sh GOLBoardImageGenerator \
        BoardImageGenerator \
        com.balistra.gameoflife.BoardImageGenerator \
        "Game of Life - Create JPEG from Board Content"

./createLambdaFunction.sh GOLGetSessionId \
        GETSessionId \
        com.balistra.gameoflife.CreateGoLSessionId \
        "Game of Life - GET Session ID"

./createLambdaFunction.sh GOLRetrieveImageLocation \
        RetrieveImageLocation \
        com.balistra.gameoflife.RetrieveImageLocation \
        "Game of Life - GET the location of a JPEG image"

