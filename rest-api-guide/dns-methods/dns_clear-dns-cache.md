---
category: /DNS Methods
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_dns_clear_cache\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"dns_config_id\": {\n      \"description\": \"\
        dns_config_id\",\n      \"type\": \"number\"\n    },\n    \"skip_reverse_cache\"\
        : {\n      \"description\": \"When true, reverse lookup results will not be\
        \ cleared from the cache.\",\n      \"type\": \"boolean\"\n    },\n    \"\
        skip_forward_cache\": {\n      \"description\": \"When true, forward lookup\
        \ results will not be cleared from the cache.\",\n      \"type\": \"boolean\"\
        \n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Clears the Qumulo local DNS cache
rest_endpoint: /v1/dns/clear-dns-cache
api_version: v1
permalink: /rest-api-guide/dns-methods/dns_clear-dns-cache.html
sidebar: rest_api_guide_sidebar
---
