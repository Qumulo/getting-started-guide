---
category: /Active Directory
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"ad_domain_leave_args\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"domain\": {\n      \"description\": \"domain\"\
        ,\n      \"type\": \"string\"\n    },\n    \"user\": {\n      \"description\"\
        : \"user\",\n      \"type\": \"string\"\n    },\n    \"password\": {\n   \
        \   \"description\": \"password\",\n      \"type\": \"string\",\n      \"\
        format\": \"password\"\n    },\n    \"dns_config_id\": {\n      \"description\"\
        : \"The unique ID of the DNS configuration to use for leaving this AD domain\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Removes the cluster from Active Directory.
rest_endpoint: /v1/ad/leave
api_version: v1
permalink: /rest-api-guide/active-directory/ad_leave.html
sidebar: rest_api_guide_sidebar
---