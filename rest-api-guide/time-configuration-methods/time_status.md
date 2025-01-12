---
category: /Time Configuration Methods
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"time_status_response\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"config\": {\n      \"description\": \"config\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"use_ad_for_primary\"\
        : {\n          \"description\": \"Whether to use the Active Directory controller\
        \ as the primary NTP server\",\n          \"type\": \"boolean\"\n        },\n\
        \        \"ntp_servers\": {\n          \"type\": \"array\",\n          \"\
        items\": {\n            \"description\": \"List of NTP servers\",\n      \
        \      \"type\": \"string\"\n          }\n        }\n      }\n    },\n   \
        \ \"time\": {\n      \"description\": \"time\",\n      \"type\": \"string\"\
        \n    },\n    \"status\": {\n      \"type\": \"string\",\n      \"enum\":\
        \ [\n        \"TIME_NOT_SYNCHRONIZING\",\n        \"TIME_SYNCHRONIZING\"\n\
        \      ],\n      \"description\": \"status:\\n * `TIME_NOT_SYNCHRONIZING`\
        \ - TIME_NOT_SYNCHRONIZING,\\n * `TIME_SYNCHRONIZING` - TIME_SYNCHRONIZING\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the time status of the underlying system
rest_endpoint: /v1/time/status
api_version: v1
permalink: /rest-api-guide/time-configuration-methods/time_status.html
sidebar: rest_api_guide_sidebar
---
