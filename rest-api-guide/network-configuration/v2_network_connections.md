---
category: /Network Configuration
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_connection_list_data\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"id\": {\n        \"description\": \"id\",\n        \"type\":\
        \ \"number\"\n      },\n      \"connections\": {\n        \"type\": \"array\"\
        ,\n        \"items\": {\n          \"description\": \"connections\",\n   \
        \       \"type\": \"object\",\n          \"properties\": {\n            \"\
        type\": {\n              \"type\": \"string\",\n              \"enum\": [\n\
        \                \"CONNECTION_TYPE_NFS\",\n                \"CONNECTION_TYPE_SMB\"\
        ,\n                \"CONNECTION_TYPE_FTP\",\n                \"CONNECTION_TYPE_REST\"\
        ,\n                \"CONNECTION_TYPE_S3\"\n              ],\n            \
        \  \"description\": \"type:\\n * `CONNECTION_TYPE_FTP` - CONNECTION_TYPE_FTP,\\\
        n * `CONNECTION_TYPE_NFS` - CONNECTION_TYPE_NFS,\\n * `CONNECTION_TYPE_REST`\
        \ - CONNECTION_TYPE_REST,\\n * `CONNECTION_TYPE_S3` - CONNECTION_TYPE_S3,\\\
        n * `CONNECTION_TYPE_SMB` - CONNECTION_TYPE_SMB\"\n            },\n      \
        \      \"network_address\": {\n              \"description\": \"network_address\"\
        ,\n              \"type\": \"string\"\n            },\n            \"tenant_id\"\
        : {\n              \"description\": \"tenant_id\",\n              \"type\"\
        : \"number\"\n            }\n          }\n        }\n      }\n    }\n  }\n\
        }"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return a list of NFS and SMB protocol connections to each node
rest_endpoint: /v2/network/connections/
api_version: v2
permalink: /rest-api-guide/network-configuration/v2_network_connections.html
sidebar: rest_api_guide_sidebar
---
