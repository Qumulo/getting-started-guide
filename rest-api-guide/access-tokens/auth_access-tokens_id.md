---
category: /Access Tokens
methods:
  delete:
    parameters:
    - description: Access Token ID
      name: id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the specified access token. Privilege ACCESS_TOKENS_WRITE is required
      to delete a token for a user other than yourself.
  get:
    parameters:
    - description: Access Token ID
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_access_token_metadata\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The\
        \ access token's identifier for management APIs.\",\n      \"type\": \"string\"\
        \n    },\n    \"user\": {\n      \"description\": \"The user that the access\
        \ token was created for.\",\n      \"type\": \"object\",\n      \"properties\"\
        : {\n        \"domain\": {\n          \"type\": \"string\",\n          \"\
        enum\": [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\",\n    \
        \        \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\"\
        ,\n            \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n\
        \            \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\"\
        ,\n            \"API_OPERATOR_DOMAIN\",\n            \"API_CREATOR_DOMAIN\"\
        \n          ],\n          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"creator\": {\n      \"description\": \"The user that created the access\
        \ token.\",\n      \"type\": \"object\",\n      \"properties\": {\n      \
        \  \"domain\": {\n          \"type\": \"string\",\n          \"enum\": [\n\
        \            \"LOCAL\",\n            \"API_NULL_DOMAIN\",\n            \"\
        WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\",\n    \
        \        \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n    \
        \        \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\",\n\
        \            \"API_OPERATOR_DOMAIN\",\n            \"API_CREATOR_DOMAIN\"\n\
        \          ],\n          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"creation_time\": {\n      \"description\": \"The time that the access\
        \ token was created.\",\n      \"type\": \"string\"\n    },\n    \"expiration_time\"\
        : {\n      \"description\": \"The time after which the access token is expired.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"enabled\": {\n      \"description\"\
        : \"This access token can be used to authenticate.\",\n      \"type\": \"\
        boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get metadata about the specified access token. Privilege ACCESS_TOKENS_READ
      is required if the token is for a user other than yourself.
  patch:
    parameters:
    - description: Access Token ID
      name: id
      required: true
    request_body:
      schema: "{\n  \"description\": \"api_access_token_modify_metadata_patch\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"expiration_time\": {\n\
        \      \"description\": \"The time after which the access token is expired.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"enabled\": {\n      \"description\"\
        : \"This access token can be used to authenticate.\",\n      \"type\": \"\
        boolean\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_access_token_metadata\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The\
        \ access token's identifier for management APIs.\",\n      \"type\": \"string\"\
        \n    },\n    \"user\": {\n      \"description\": \"The user that the access\
        \ token was created for.\",\n      \"type\": \"object\",\n      \"properties\"\
        : {\n        \"domain\": {\n          \"type\": \"string\",\n          \"\
        enum\": [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\",\n    \
        \        \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\"\
        ,\n            \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n\
        \            \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\"\
        ,\n            \"API_OPERATOR_DOMAIN\",\n            \"API_CREATOR_DOMAIN\"\
        \n          ],\n          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"creator\": {\n      \"description\": \"The user that created the access\
        \ token.\",\n      \"type\": \"object\",\n      \"properties\": {\n      \
        \  \"domain\": {\n          \"type\": \"string\",\n          \"enum\": [\n\
        \            \"LOCAL\",\n            \"API_NULL_DOMAIN\",\n            \"\
        WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\",\n    \
        \        \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n    \
        \        \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\",\n\
        \            \"API_OPERATOR_DOMAIN\",\n            \"API_CREATOR_DOMAIN\"\n\
        \          ],\n          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"creation_time\": {\n      \"description\": \"The time that the access\
        \ token was created.\",\n      \"type\": \"string\"\n    },\n    \"expiration_time\"\
        : {\n      \"description\": \"The time after which the access token is expired.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"enabled\": {\n      \"description\"\
        : \"This access token can be used to authenticate.\",\n      \"type\": \"\
        boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Modify metadata for the specified access token. Privilege ACCESS_TOKENS_WRITE
      is required to modify a token for a user other than yourself.
rest_endpoint: /v1/auth/access-tokens/{id}
api_version: v1
permalink: /rest-api-guide/access-tokens/auth_access-tokens_id.html
sidebar: rest_api_guide_sidebar
---
