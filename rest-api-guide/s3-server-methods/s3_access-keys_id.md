---
category: /S3 Server Methods
methods:
  delete:
    parameters:
    - description: Access Key ID
      name: id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the key identified by the given Access Key ID the current user.
      Access is revoked immediately. Privilege S3_CREDENTIALS_WRITE is required to
      delete a key for a user other than yourself.
rest_endpoint: /v1/s3/access-keys/{id}
api_version: v1
permalink: /rest-api-guide/s3-server-methods/s3_access-keys_id.html
sidebar: rest_api_guide_sidebar
---
