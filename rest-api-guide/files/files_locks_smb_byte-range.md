---
category: /Files
methods:
  get:
    parameters:
    - description: IP Address of the client that owns the lock.
      name: owner_address
      required: false
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_byte_range_grants\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"grants\": {\n      \"type\": \"array\",\n  \
        \    \"items\": {\n        \"description\": \"grants\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"file_id\": {\n     \
        \       \"description\": \"file_id\",\n            \"type\": \"string\"\n\
        \          },\n          \"stream_id\": {\n            \"description\": \"\
        stream_id\",\n            \"type\": \"string\"\n          },\n          \"\
        snapshot_id\": {\n            \"description\": \"The locked file's snapshot\
        \ ID. Empty if the file is at the head version (not from a snapshot).\",\n\
        \            \"type\": \"string\"\n          },\n          \"mode\": {\n \
        \           \"type\": \"array\",\n            \"items\": {\n             \
        \ \"type\": \"string\",\n              \"enum\": [\n                \"API_BYTE_RANGE_EXCLUSIVE\"\
        ,\n                \"API_BYTE_RANGE_SHARED\",\n                \"API_BYTE_RANGE_READ_OP\"\
        ,\n                \"API_BYTE_RANGE_WRITE_OP\"\n              ],\n       \
        \       \"description\": \"mode:\\n * `API_BYTE_RANGE_EXCLUSIVE` - API_BYTE_RANGE_EXCLUSIVE,\\\
        n * `API_BYTE_RANGE_READ_OP` - API_BYTE_RANGE_READ_OP,\\n * `API_BYTE_RANGE_SHARED`\
        \ - API_BYTE_RANGE_SHARED,\\n * `API_BYTE_RANGE_WRITE_OP` - API_BYTE_RANGE_WRITE_OP\"\
        \n            }\n          },\n          \"offset\": {\n            \"description\"\
        : \"offset\",\n            \"type\": \"string\"\n          },\n          \"\
        size\": {\n            \"description\": \"size\",\n            \"type\": \"\
        string\"\n          },\n          \"owner_id\": {\n            \"description\"\
        : \"The unique identifier for the process that owns the file lock.\",\n  \
        \          \"type\": \"string\"\n          },\n          \"owner_name\": {\n\
        \            \"description\": \"The name of the machine that owns the lock.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"owner_address\"\
        : {\n            \"description\": \"The IP address to use for acquiring the\
        \ file lock.\",\n            \"type\": \"string\"\n          },\n        \
        \  \"node_address\": {\n            \"description\": \"The IP address of the\
        \ node that receives the request.\",\n            \"type\": \"string\"\n \
        \         }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return a list of all granted file locks that the specified machine owns.
rest_endpoint: /v1/files/locks/smb/byte-range/
api_version: v1
permalink: /rest-api-guide/files/files_locks_smb_byte-range.html
sidebar: rest_api_guide_sidebar
---
