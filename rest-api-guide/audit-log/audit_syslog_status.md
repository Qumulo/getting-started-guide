---
category: /Audit Log
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"syslog_audit_log_status\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"connection_status\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"AUDIT_LOG_CONNECTED\",\n     \
        \   \"AUDIT_LOG_CONNECTING\",\n        \"AUDIT_LOG_DISABLED\",\n        \"\
        AUDIT_LOG_DISCONNECTED\"\n      ],\n      \"description\": \"The current connection\
        \ status of the audit logger.:\\n * `AUDIT_LOG_CONNECTED` - AUDIT_LOG_CONNECTED,\\\
        n * `AUDIT_LOG_CONNECTING` - AUDIT_LOG_CONNECTING,\\n * `AUDIT_LOG_DISABLED`\
        \ - AUDIT_LOG_DISABLED,\\n * `AUDIT_LOG_DISCONNECTED` - AUDIT_LOG_DISCONNECTED\"\
        \n    },\n    \"error_message\": {\n      \"description\": \"The current error,\
        \ if audit is disconnected.\",\n      \"type\": \"string\"\n    },\n    \"\
        error_details\": {\n      \"description\": \"Internal details for the current\
        \ error, if audit is disconnected.\",\n      \"type\": \"string\"\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieves the syslog connection status of audit log.
rest_endpoint: /v1/audit/syslog/status
api_version: v1
permalink: /rest-api-guide/audit-log/audit_syslog_status.html
sidebar: rest_api_guide_sidebar
---
