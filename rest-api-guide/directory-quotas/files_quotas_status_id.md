---
category: /Directory Quotas
methods:
  get:
    parameters:
    - description: Directory ID
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_files_quota_status\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique ID\
        \ of this directory.\",\n      \"type\": \"string\"\n    },\n    \"path\"\
        : {\n      \"description\": \"Full path of this directory.\",\n      \"type\"\
        : \"string\"\n    },\n    \"limit\": {\n      \"description\": \"Limit in\
        \ bytes of the cumulative size of this directory and its descendants.\",\n\
        \      \"type\": \"string\"\n    },\n    \"capacity_usage\": {\n      \"description\"\
        : \"Capacity used by this directory and all of its children, in bytes.\",\n\
        \      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get the directory quota for a directory, its limit in bytes, and current
      capacity usage.
rest_endpoint: /v1/files/quotas/status/{id}
api_version: v1
permalink: /rest-api-guide/directory-quotas/files_quotas_status_id.html
sidebar: rest_api_guide_sidebar
---
