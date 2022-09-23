#!/bin/bash

/Applications/Unity/Hub/Editor/2021.3.9f1/Unity.app/Contents/MacOS/Unity -batchMode -projectPath . -testPlatform EditMode -nographics -quit
/Applications/Unity/Hub/Editor/2021.3.9f1/Unity.app/Contents/MacOS/Unity -runTests -batchMode -projectPath . -testPlatform EditMode -testResults /tmp/nunit-results.xml
curl https://raw.githubusercontent.com/nunit/nunit-transforms/master/nunit3-junit/nunit3-junit.xslt > /tmp/nunit3-junit.xslt
xsltproc /tmp/nunit3-junit.xslt /tmp/nunit-results.xml > /tmp/junit-results.xml
npx xunit-viewer --results=/tmp/junit-results.xml --title "Tradelite Unity SDK" --output=/tmp/report.html --console