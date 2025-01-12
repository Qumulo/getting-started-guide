---
category: /Cluster Management
methods:
  get:
    parameters:
    - description: The unique ID of the node
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_node\",\n  \"type\": \"object\",\n  \"\
        properties\": {\n    \"id\": {\n      \"description\": \"id\",\n      \"type\"\
        : \"number\"\n    },\n    \"node_status\": {\n      \"description\": \"Status\
        \ of the node\",\n      \"type\": \"string\"\n    },\n    \"node_name\": {\n\
        \      \"description\": \"User friendly node name\",\n      \"type\": \"string\"\
        \n    },\n    \"uuid\": {\n      \"description\": \"Unique node identifier\"\
        ,\n      \"type\": \"string\"\n    },\n    \"label\": {\n      \"description\"\
        : \"Physically identifiable label assigned to the hardware\",\n      \"type\"\
        : \"string\"\n    },\n    \"model_number\": {\n      \"description\": \"Node\
        \ model number\",\n      \"type\": \"string\"\n    },\n    \"serial_number\"\
        : {\n      \"description\": \"Serial number\",\n      \"type\": \"string\"\
        \n    },\n    \"mac_address\": {\n      \"description\": \"MAC address for\
        \ the first network interface on this node\",\n      \"type\": \"string\"\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve node-specific info, such as serial number, mac address, uuid,
      etc
rest_endpoint: /v1/cluster/nodes/{id}
api_version: v1
permalink: /rest-api-guide/cluster-management/cluster_nodes_id.html
sidebar: rest_api_guide_sidebar
---
