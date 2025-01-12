---
category: /Tree Delete
methods:
  delete:
    parameters:
    - description: Job ID
      name: id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Cancel directory-tree deletion on the specified directory. If the job
      has finished, returns 404. Also returns 404 if there was never a job on the
      given object
  get:
    parameters:
    - description: Job ID
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"tree_delete_job_status\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The ID of\
        \ the directory being deleted.\",\n      \"type\": \"string\"\n    },\n  \
        \  \"create_time\": {\n      \"description\": \"The time the job was created.\
        \ It may not have started at that time if the system was processing other\
        \ jobs.\",\n      \"type\": \"string\"\n    },\n    \"mode\": {\n      \"\
        type\": \"string\",\n      \"enum\": [\n        \"IN_PLACE\",\n        \"\
        PORTAL_DELETION\",\n        \"PORTAL_EVICTION\"\n      ],\n      \"description\"\
        : \"The tree delete mode this job is running in.:\\n * `IN_PLACE` - TREE_DELETE_IN_PLACE,\\\
        n * `PORTAL_DELETION` - TREE_DELETE_PORTAL_DELETION,\\n * `PORTAL_EVICTION`\
        \ - TREE_DELETE_PORTAL_EVICTION\"\n    },\n    \"initial_path\": {\n     \
        \ \"description\": \"The path of the directory at the time the job was started.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"initial_capacity\": {\n     \
        \ \"description\": \"Initial bytes (data and metadata) used by the tree being\
        \ deleted.\",\n      \"type\": \"string\"\n    },\n    \"initial_directories\"\
        : {\n      \"description\": \"Initial number of directories in the tree being\
        \ deleted.\",\n      \"type\": \"string\"\n    },\n    \"initial_files\":\
        \ {\n      \"description\": \"Initial number of non-directory files in the\
        \ tree being deleted.\",\n      \"type\": \"string\"\n    },\n    \"remaining_capacity\"\
        : {\n      \"description\": \"Remaining bytes (data and metadata) used by\
        \ the tree being deleted.\",\n      \"type\": \"string\"\n    },\n    \"remaining_directories\"\
        : {\n      \"description\": \"Remaining number of directories in the tree\
        \ being deleted.\",\n      \"type\": \"string\"\n    },\n    \"remaining_files\"\
        : {\n      \"description\": \"Remaining number of non-directory files in the\
        \ tree being deleted.\",\n      \"type\": \"string\"\n    },\n    \"last_error_message\"\
        : {\n      \"description\": \"The message from the last error that caused\
        \ this job to be aborted.\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get status of directory-tree deletion on the specified directory. If
      the job has finished, returns 404. Also returns 404 if there was never a job
      on the given object
rest_endpoint: /v1/tree-delete/jobs/{id}
api_version: v1
permalink: /rest-api-guide/tree-delete/tree-delete_jobs_id.html
sidebar: rest_api_guide_sidebar
---
