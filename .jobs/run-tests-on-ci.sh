#!/usr/bin/env bash

body="{
\"request\": {
  \"message\": \"requested via API: $1 job\",
  \"branch\":\"master\",
  \"config\": {
    \"language\": \"java\",
    \"before_install\": [\"export DISPLAY=:99.0\", \"sh -e /etc/init.d/xvfb start\"],
    \"script\": \"mvn clean test -P$1\",
    \"notifications\": {\"email\": \"yashaka@gmail.com\"}
  }
}
}"

curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token QyDo4TdLZHm6-L8rjF_6oQ" \
  -d "$body" \
  https://api.travis-ci.org/repo/yashaka%2Ftasj-test-suites/requests