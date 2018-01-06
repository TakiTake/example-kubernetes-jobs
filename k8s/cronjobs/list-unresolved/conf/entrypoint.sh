echo ${JIRA_PASSWORD} | /root/jira login --user=${JIRA_USERNAME}
/root/jira list-unresolved | /root/slackboard-cli -t general -s ${SLACKBOARD_SERVICE_HOST}:${SLACKBOARD_SERVICE_PORT}
