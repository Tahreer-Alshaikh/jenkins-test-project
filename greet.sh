#!/bin/bash

# Slack Webhook URL (CONFIDENTIAL - do not share publicly)
WEBHOOK_URL="https://hooks.slack.com/services/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"

# Get environment info from Jenkins
JOB_NAME=${JOB_NAME:-"Unknown Job"}
BUILD_NUMBER=${BUILD_NUMBER:-"N/A"}
BUILD_URL=${BUILD_URL:-"N/A"}
EC2_INSTANCE=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)

# Compose professional Slack message
MESSAGE=":rocket: *Jenkins Job Notification*
*Job:* \`${JOB_NAME}\`
*Build Number:* \`#${BUILD_NUMBER}\`
*Status:* ✅ Successfully executed from EC2
*Instance:* \`${EC2_INSTANCE}\`
*Details:* <${BUILD_URL}|View Build Logs>"

# Send the message to Slack
curl -X POST -H 'Content-type: application/json' --data "{
  \"text\": \"$MESSAGE\"
}" "$WEBHOOK_URL"
