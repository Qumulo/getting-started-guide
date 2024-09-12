---
category: /Files
methods:
  post:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_files_apply_mode_explanation_post\",\n\
        \  \"type\": \"object\",\n  \"properties\": {\n    \"mode\": {\n      \"description\"\
        : \"POSIX mode to explain application of on a file ACL.\",\n      \"type\"\
        : \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_files_apply_mode_explanation\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"owner\": {\n      \"description\"\
        : \"The user that owns the file.\",\n      \"type\": \"object\",\n      \"\
        properties\": {\n        \"domain\": {\n          \"type\": \"string\",\n\
        \          \"enum\": [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\"\
        ,\n            \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\"\
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
        \    \"group_owner\": {\n      \"description\": \"The group-owner for the\
        \ file.\",\n      \"type\": \"object\",\n      \"properties\": {\n       \
        \ \"domain\": {\n          \"type\": \"string\",\n          \"enum\": [\n\
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
        \    \"owner_rights_from_mode\": {\n      \"description\": \"The rights granted\
        \ to the POSIX owner by the requested mode.\",\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n\
        \          \"READ\",\n          \"READ_EA\",\n          \"READ_ATTR\",\n \
        \         \"READ_ACL\",\n          \"WRITE_EA\",\n          \"WRITE_ATTR\"\
        ,\n          \"WRITE_ACL\",\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\"\
        ,\n          \"DELETE\",\n          \"EXECUTE\",\n          \"MODIFY\",\n\
        \          \"EXTEND\",\n          \"ADD_FILE\",\n          \"ADD_SUBDIR\"\
        ,\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\",\n          \"ACCESS_RIGHTS_ALL\"\
        \n        ],\n        \"description\": \"The rights granted to the POSIX owner\
        \ by the requested mode.:\\n * `ACCESS_RIGHTS_ALL` - All access rights,\\\
        n * `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR` - Directory creation\
        \ access,\\n * `CHANGE_OWNER` - Owner write access,\\n * `DELETE` - Delete\
        \ access,\\n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE`\
        \ - Execute access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` -\
        \ File modification access,\\n * `READ` - File read access,\\n * `READ_ACL`\
        \ - ACL read access,\\n * `READ_ATTR` - Attribute read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR` - Attribute\
        \ write access,\\n * `WRITE_EA` - Extended attribute write access,\\n * `WRITE_GROUP`\
        \ - Group write access\"\n      }\n    },\n    \"group_rights_from_mode\"\
        : {\n      \"description\": \"The rights granted to the POSIX group by the\
        \ requested mode.\",\n      \"type\": \"array\",\n      \"items\": {\n   \
        \     \"type\": \"string\",\n        \"enum\": [\n          \"READ\",\n  \
        \        \"READ_EA\",\n          \"READ_ATTR\",\n          \"READ_ACL\",\n\
        \          \"WRITE_EA\",\n          \"WRITE_ATTR\",\n          \"WRITE_ACL\"\
        ,\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\",\n          \"DELETE\"\
        ,\n          \"EXECUTE\",\n          \"MODIFY\",\n          \"EXTEND\",\n\
        \          \"ADD_FILE\",\n          \"ADD_SUBDIR\",\n          \"DELETE_CHILD\"\
        ,\n          \"SYNCHRONIZE\",\n          \"ACCESS_RIGHTS_ALL\"\n        ],\n\
        \        \"description\": \"The rights granted to the POSIX group by the requested\
        \ mode.:\\n * `ACCESS_RIGHTS_ALL` - All access rights,\\n * `ADD_FILE` - File\
        \ creation access,\\n * `ADD_SUBDIR` - Directory creation access,\\n * `CHANGE_OWNER`\
        \ - Owner write access,\\n * `DELETE` - Delete access,\\n * `DELETE_CHILD`\
        \ - Delete from directory access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND`\
        \ - File extension access,\\n * `MODIFY` - File modification access,\\n *\
        \ `READ` - File read access,\\n * `READ_ACL` - ACL read access,\\n * `READ_ATTR`\
        \ - Attribute read access,\\n * `READ_EA` - Extended attribute read access,\\\
        n * `SYNCHRONIZE` - File synchronize access,\\n * `WRITE_ACL` - ACL write\
        \ access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA` - Extended\
        \ attribute write access,\\n * `WRITE_GROUP` - Group write access\"\n    \
        \  }\n    },\n    \"other_rights_from_mode\": {\n      \"description\": \"\
        The rights granted to the POSIX other by the requested mode.\",\n      \"\
        type\": \"array\",\n      \"items\": {\n        \"type\": \"string\",\n  \
        \      \"enum\": [\n          \"READ\",\n          \"READ_EA\",\n        \
        \  \"READ_ATTR\",\n          \"READ_ACL\",\n          \"WRITE_EA\",\n    \
        \      \"WRITE_ATTR\",\n          \"WRITE_ACL\",\n          \"CHANGE_OWNER\"\
        ,\n          \"WRITE_GROUP\",\n          \"DELETE\",\n          \"EXECUTE\"\
        ,\n          \"MODIFY\",\n          \"EXTEND\",\n          \"ADD_FILE\",\n\
        \          \"ADD_SUBDIR\",\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\"\
        ,\n          \"ACCESS_RIGHTS_ALL\"\n        ],\n        \"description\": \"\
        The rights granted to the POSIX other by the requested mode.:\\n * `ACCESS_RIGHTS_ALL`\
        \ - All access rights,\\n * `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR`\
        \ - Directory creation access,\\n * `CHANGE_OWNER` - Owner write access,\\\
        n * `DELETE` - Delete access,\\n * `DELETE_CHILD` - Delete from directory\
        \ access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND` - File extension\
        \ access,\\n * `MODIFY` - File modification access,\\n * `READ` - File read\
        \ access,\\n * `READ_ACL` - ACL read access,\\n * `READ_ATTR` - Attribute\
        \ read access,\\n * `READ_EA` - Extended attribute read access,\\n * `SYNCHRONIZE`\
        \ - File synchronize access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR`\
        \ - Attribute write access,\\n * `WRITE_EA` - Extended attribute write access,\\\
        n * `WRITE_GROUP` - Group write access\"\n      }\n    },\n    \"max_extra_ace_allow\"\
        : {\n      \"description\": \"The maximum rights that any extra allow ACE\
        \ can specify.\",\n      \"type\": \"array\",\n      \"items\": {\n      \
        \  \"type\": \"string\",\n        \"enum\": [\n          \"READ\",\n     \
        \     \"READ_EA\",\n          \"READ_ATTR\",\n          \"READ_ACL\",\n  \
        \        \"WRITE_EA\",\n          \"WRITE_ATTR\",\n          \"WRITE_ACL\"\
        ,\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\",\n          \"DELETE\"\
        ,\n          \"EXECUTE\",\n          \"MODIFY\",\n          \"EXTEND\",\n\
        \          \"ADD_FILE\",\n          \"ADD_SUBDIR\",\n          \"DELETE_CHILD\"\
        ,\n          \"SYNCHRONIZE\",\n          \"ACCESS_RIGHTS_ALL\"\n        ],\n\
        \        \"description\": \"The maximum rights that any extra allow ACE can\
        \ specify.:\\n * `ACCESS_RIGHTS_ALL` - All access rights,\\n * `ADD_FILE`\
        \ - File creation access,\\n * `ADD_SUBDIR` - Directory creation access,\\\
        n * `CHANGE_OWNER` - Owner write access,\\n * `DELETE` - Delete access,\\\
        n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE` - Execute\
        \ access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` - File modification\
        \ access,\\n * `READ` - File read access,\\n * `READ_ACL` - ACL read access,\\\
        n * `READ_ATTR` - Attribute read access,\\n * `READ_EA` - Extended attribute\
        \ read access,\\n * `SYNCHRONIZE` - File synchronize access,\\n * `WRITE_ACL`\
        \ - ACL write access,\\n * `WRITE_ATTR` - Attribute write access,\\n * `WRITE_EA`\
        \ - Extended attribute write access,\\n * `WRITE_GROUP` - Group write access\"\
        \n      }\n    },\n    \"max_extra_ace_deny\": {\n      \"description\": \"\
        The maximum rights that any extra deny ACE can specify.\",\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"type\": \"string\",\n        \"\
        enum\": [\n          \"READ\",\n          \"READ_EA\",\n          \"READ_ATTR\"\
        ,\n          \"READ_ACL\",\n          \"WRITE_EA\",\n          \"WRITE_ATTR\"\
        ,\n          \"WRITE_ACL\",\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\"\
        ,\n          \"DELETE\",\n          \"EXECUTE\",\n          \"MODIFY\",\n\
        \          \"EXTEND\",\n          \"ADD_FILE\",\n          \"ADD_SUBDIR\"\
        ,\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\",\n          \"ACCESS_RIGHTS_ALL\"\
        \n        ],\n        \"description\": \"The maximum rights that any extra\
        \ deny ACE can specify.:\\n * `ACCESS_RIGHTS_ALL` - All access rights,\\n\
        \ * `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR` - Directory creation\
        \ access,\\n * `CHANGE_OWNER` - Owner write access,\\n * `DELETE` - Delete\
        \ access,\\n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE`\
        \ - Execute access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` -\
        \ File modification access,\\n * `READ` - File read access,\\n * `READ_ACL`\
        \ - ACL read access,\\n * `READ_ATTR` - Attribute read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR` - Attribute\
        \ write access,\\n * `WRITE_EA` - Extended attribute write access,\\n * `WRITE_GROUP`\
        \ - Group write access\"\n      }\n    },\n    \"not_produced_by_any_mode\"\
        : {\n      \"description\": \"Rights that are never produced by a POSIX mode\
        \ bit.\",\n      \"type\": \"array\",\n      \"items\": {\n        \"type\"\
        : \"string\",\n        \"enum\": [\n          \"READ\",\n          \"READ_EA\"\
        ,\n          \"READ_ATTR\",\n          \"READ_ACL\",\n          \"WRITE_EA\"\
        ,\n          \"WRITE_ATTR\",\n          \"WRITE_ACL\",\n          \"CHANGE_OWNER\"\
        ,\n          \"WRITE_GROUP\",\n          \"DELETE\",\n          \"EXECUTE\"\
        ,\n          \"MODIFY\",\n          \"EXTEND\",\n          \"ADD_FILE\",\n\
        \          \"ADD_SUBDIR\",\n          \"DELETE_CHILD\",\n          \"SYNCHRONIZE\"\
        ,\n          \"ACCESS_RIGHTS_ALL\"\n        ],\n        \"description\": \"\
        Rights that are never produced by a POSIX mode bit.:\\n * `ACCESS_RIGHTS_ALL`\
        \ - All access rights,\\n * `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR`\
        \ - Directory creation access,\\n * `CHANGE_OWNER` - Owner write access,\\\
        n * `DELETE` - Delete access,\\n * `DELETE_CHILD` - Delete from directory\
        \ access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND` - File extension\
        \ access,\\n * `MODIFY` - File modification access,\\n * `READ` - File read\
        \ access,\\n * `READ_ACL` - ACL read access,\\n * `READ_ATTR` - Attribute\
        \ read access,\\n * `READ_EA` - Extended attribute read access,\\n * `SYNCHRONIZE`\
        \ - File synchronize access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR`\
        \ - Attribute write access,\\n * `WRITE_EA` - Extended attribute write access,\\\
        n * `WRITE_GROUP` - Group write access\"\n      }\n    },\n    \"not_visible_in_mode\"\
        : {\n      \"description\": \"Rights that will never cause a bit to be set\
        \ in the displayed mode.\",\n      \"type\": \"array\",\n      \"items\":\
        \ {\n        \"type\": \"string\",\n        \"enum\": [\n          \"READ\"\
        ,\n          \"READ_EA\",\n          \"READ_ATTR\",\n          \"READ_ACL\"\
        ,\n          \"WRITE_EA\",\n          \"WRITE_ATTR\",\n          \"WRITE_ACL\"\
        ,\n          \"CHANGE_OWNER\",\n          \"WRITE_GROUP\",\n          \"DELETE\"\
        ,\n          \"EXECUTE\",\n          \"MODIFY\",\n          \"EXTEND\",\n\
        \          \"ADD_FILE\",\n          \"ADD_SUBDIR\",\n          \"DELETE_CHILD\"\
        ,\n          \"SYNCHRONIZE\",\n          \"ACCESS_RIGHTS_ALL\"\n        ],\n\
        \        \"description\": \"Rights that will never cause a bit to be set in\
        \ the displayed mode.:\\n * `ACCESS_RIGHTS_ALL` - All access rights,\\n *\
        \ `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR` - Directory creation\
        \ access,\\n * `CHANGE_OWNER` - Owner write access,\\n * `DELETE` - Delete\
        \ access,\\n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE`\
        \ - Execute access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` -\
        \ File modification access,\\n * `READ` - File read access,\\n * `READ_ACL`\
        \ - ACL read access,\\n * `READ_ATTR` - Attribute read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR` - Attribute\
        \ write access,\\n * `WRITE_EA` - Extended attribute write access,\\n * `WRITE_GROUP`\
        \ - Group write access\"\n      }\n    },\n    \"annotated_aces\": {\n   \
        \   \"type\": \"array\",\n      \"items\": {\n        \"description\": \"\
        The annotated steps that would be taken to apply the requested mode to the\
        \ source ACL.\",\n        \"type\": \"object\",\n        \"properties\": {\n\
        \          \"source_ace\": {\n            \"description\": \"Original ACE\
        \ that this step affects.\",\n            \"type\": \"object\",\n        \
        \    \"properties\": {\n              \"type\": {\n                \"type\"\
        : \"string\",\n                \"enum\": [\n                  \"ALLOWED\"\
        ,\n                  \"DENIED\"\n                ],\n                \"description\"\
        : \"Type of this ACL entry:\\n * `ALLOWED` - An ACL entry that grants rights,\\\
        n * `DENIED` - An ACL entry that denies rights\"\n              },\n     \
        \         \"flags\": {\n                \"description\": \"ACE flags for this\
        \ ACL entry\",\n                \"type\": \"array\",\n                \"items\"\
        : {\n                  \"type\": \"string\",\n                  \"enum\":\
        \ [\n                    \"OBJECT_INHERIT\",\n                    \"CONTAINER_INHERIT\"\
        ,\n                    \"NO_PROPAGATE_INHERIT\",\n                    \"INHERIT_ONLY\"\
        ,\n                    \"INHERITED\",\n                    \"ACE_FLAGS_ALL\"\
        \n                  ],\n                  \"description\": \"ACE flags for\
        \ this ACL entry:\\n * `ACE_FLAGS_ALL` - All ACE flags,\\n * `CONTAINER_INHERIT`\
        \ - Children that are containers inherit as effective ACE,\\n * `INHERITED`\
        \ - Indicates the ACE was inherited,\\n * `INHERIT_ONLY` - Indicates an inherit-only\
        \ ACE that doesn't control access to the attached object,\\n * `NO_PROPAGATE_INHERIT`\
        \ - Prevent subsequent children from inheriting ACE,\\n * `OBJECT_INHERIT`\
        \ - Non-container children inherit as effective ACE. Container objects inherit\
        \ as inherit-only ACE\"\n                }\n              },\n           \
        \   \"trustee\": {\n                \"description\": \"Trustee for this ACL\
        \ entry\",\n                \"type\": \"object\",\n                \"properties\"\
        : {\n                  \"domain\": {\n                    \"type\": \"string\"\
        ,\n                    \"enum\": [\n                      \"LOCAL\",\n   \
        \                   \"API_NULL_DOMAIN\",\n                      \"WORLD\"\
        ,\n                      \"POSIX_USER\",\n                      \"POSIX_GROUP\"\
        ,\n                      \"ACTIVE_DIRECTORY\",\n                      \"API_INVALID_DOMAIN\"\
        ,\n                      \"API_RESERVED_DOMAIN\",\n                      \"\
        API_INTERNAL_DOMAIN\",\n                      \"API_OPERATOR_DOMAIN\",\n \
        \                     \"API_CREATOR_DOMAIN\"\n                    ],\n   \
        \                 \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n                  },\n                  \"auth_id\": {\n    \
        \                \"description\": \"auth_id\",\n                    \"type\"\
        : \"string\"\n                  },\n                  \"uid\": {\n       \
        \             \"description\": \"uid\",\n                    \"type\": \"\
        number\"\n                  },\n                  \"gid\": {\n           \
        \         \"description\": \"gid\",\n                    \"type\": \"number\"\
        \n                  },\n                  \"sid\": {\n                   \
        \ \"description\": \"sid\",\n                    \"type\": \"string\"\n  \
        \                },\n                  \"name\": {\n                    \"\
        description\": \"name\",\n                    \"type\": \"string\"\n     \
        \             }\n                }\n              },\n              \"rights\"\
        : {\n                \"description\": \"Rights granted or denied for this\
        \ ACL entry\",\n                \"type\": \"array\",\n                \"items\"\
        : {\n                  \"type\": \"string\",\n                  \"enum\":\
        \ [\n                    \"READ\",\n                    \"READ_EA\",\n   \
        \                 \"READ_ATTR\",\n                    \"READ_ACL\",\n    \
        \                \"WRITE_EA\",\n                    \"WRITE_ATTR\",\n    \
        \                \"WRITE_ACL\",\n                    \"CHANGE_OWNER\",\n \
        \                   \"WRITE_GROUP\",\n                    \"DELETE\",\n  \
        \                  \"EXECUTE\",\n                    \"MODIFY\",\n       \
        \             \"EXTEND\",\n                    \"ADD_FILE\",\n           \
        \         \"ADD_SUBDIR\",\n                    \"DELETE_CHILD\",\n       \
        \             \"SYNCHRONIZE\",\n                    \"ACCESS_RIGHTS_ALL\"\n\
        \                  ],\n                  \"description\": \"Rights granted\
        \ or denied for this ACL entry:\\n * `ACCESS_RIGHTS_ALL` - All access rights,\\\
        n * `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR` - Directory creation\
        \ access,\\n * `CHANGE_OWNER` - Owner write access,\\n * `DELETE` - Delete\
        \ access,\\n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE`\
        \ - Execute access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` -\
        \ File modification access,\\n * `READ` - File read access,\\n * `READ_ACL`\
        \ - ACL read access,\\n * `READ_ATTR` - Attribute read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR` - Attribute\
        \ write access,\\n * `WRITE_EA` - Extended attribute write access,\\n * `WRITE_GROUP`\
        \ - Group write access\"\n                }\n              }\n           \
        \ }\n          },\n          \"source_trustee_match\": {\n            \"description\"\
        : \"Describes which POSIX mode classes the source ACE matches.\",\n      \
        \      \"type\": \"array\",\n            \"items\": {\n              \"type\"\
        : \"string\",\n              \"enum\": [\n                \"POSIX_OWNER\"\
        ,\n                \"POSIX_GROUP_OWNER\",\n                \"POSIX_OTHERS\"\
        ,\n                \"NON_POSIX\"\n              ],\n              \"description\"\
        : \"Describes which POSIX mode classes the source ACE matches.:\\n * `NON_POSIX`\
        \ - NON_POSIX,\\n * `POSIX_GROUP_OWNER` - POSIX_GROUP_OWNER,\\n * `POSIX_OTHERS`\
        \ - POSIX_OTHERS,\\n * `POSIX_OWNER` - POSIX_OWNER\"\n            }\n    \
        \      },\n          \"action\": {\n            \"type\": \"string\",\n  \
        \          \"enum\": [\n              \"COPY_ACE\",\n              \"MODIFY_ACE\"\
        ,\n              \"INSERT_ACE\",\n              \"REMOVE_ACE\"\n         \
        \   ],\n            \"description\": \"The action being performed in this\
        \ step to affect the ACL.:\\n * `COPY_ACE` - COPY_ACE,\\n * `INSERT_ACE` -\
        \ INSERT_ACE,\\n * `MODIFY_ACE` - MODIFY_ACE,\\n * `REMOVE_ACE` - REMOVE_ACE\"\
        \n          },\n          \"reason\": {\n            \"description\": \"An\
        \ explanation of why the action is being performed.\",\n            \"type\"\
        : \"string\"\n          },\n          \"rights_removed\": {\n            \"\
        description\": \"Any rights that are removed from the source ACE in this step.\"\
        ,\n            \"type\": \"array\",\n            \"items\": {\n          \
        \    \"type\": \"string\",\n              \"enum\": [\n                \"\
        READ\",\n                \"READ_EA\",\n                \"READ_ATTR\",\n  \
        \              \"READ_ACL\",\n                \"WRITE_EA\",\n            \
        \    \"WRITE_ATTR\",\n                \"WRITE_ACL\",\n                \"CHANGE_OWNER\"\
        ,\n                \"WRITE_GROUP\",\n                \"DELETE\",\n       \
        \         \"EXECUTE\",\n                \"MODIFY\",\n                \"EXTEND\"\
        ,\n                \"ADD_FILE\",\n                \"ADD_SUBDIR\",\n      \
        \          \"DELETE_CHILD\",\n                \"SYNCHRONIZE\",\n         \
        \       \"ACCESS_RIGHTS_ALL\"\n              ],\n              \"description\"\
        : \"Any rights that are removed from the source ACE in this step.:\\n * `ACCESS_RIGHTS_ALL`\
        \ - All access rights,\\n * `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR`\
        \ - Directory creation access,\\n * `CHANGE_OWNER` - Owner write access,\\\
        n * `DELETE` - Delete access,\\n * `DELETE_CHILD` - Delete from directory\
        \ access,\\n * `EXECUTE` - Execute access,\\n * `EXTEND` - File extension\
        \ access,\\n * `MODIFY` - File modification access,\\n * `READ` - File read\
        \ access,\\n * `READ_ACL` - ACL read access,\\n * `READ_ATTR` - Attribute\
        \ read access,\\n * `READ_EA` - Extended attribute read access,\\n * `SYNCHRONIZE`\
        \ - File synchronize access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR`\
        \ - Attribute write access,\\n * `WRITE_EA` - Extended attribute write access,\\\
        n * `WRITE_GROUP` - Group write access\"\n            }\n          },\n  \
        \        \"flags_removed\": {\n            \"description\": \"Any flags that\
        \ are removed from the source ACE in this step.\",\n            \"type\":\
        \ \"array\",\n            \"items\": {\n              \"type\": \"string\"\
        ,\n              \"enum\": [\n                \"OBJECT_INHERIT\",\n      \
        \          \"CONTAINER_INHERIT\",\n                \"NO_PROPAGATE_INHERIT\"\
        ,\n                \"INHERIT_ONLY\",\n                \"INHERITED\",\n   \
        \             \"ACE_FLAGS_ALL\"\n              ],\n              \"description\"\
        : \"Any flags that are removed from the source ACE in this step.:\\n * `ACE_FLAGS_ALL`\
        \ - All ACE flags,\\n * `CONTAINER_INHERIT` - Children that are containers\
        \ inherit as effective ACE,\\n * `INHERITED` - Indicates the ACE was inherited,\\\
        n * `INHERIT_ONLY` - Indicates an inherit-only ACE that doesn't control access\
        \ to the attached object,\\n * `NO_PROPAGATE_INHERIT` - Prevent subsequent\
        \ children from inheriting ACE,\\n * `OBJECT_INHERIT` - Non-container children\
        \ inherit as effective ACE. Container objects inherit as inherit-only ACE\"\
        \n            }\n          },\n          \"flags_added\": {\n            \"\
        description\": \"Any flags that are added from the source ACE in this step.\"\
        ,\n            \"type\": \"array\",\n            \"items\": {\n          \
        \    \"type\": \"string\",\n              \"enum\": [\n                \"\
        OBJECT_INHERIT\",\n                \"CONTAINER_INHERIT\",\n              \
        \  \"NO_PROPAGATE_INHERIT\",\n                \"INHERIT_ONLY\",\n        \
        \        \"INHERITED\",\n                \"ACE_FLAGS_ALL\"\n             \
        \ ],\n              \"description\": \"Any flags that are added from the source\
        \ ACE in this step.:\\n * `ACE_FLAGS_ALL` - All ACE flags,\\n * `CONTAINER_INHERIT`\
        \ - Children that are containers inherit as effective ACE,\\n * `INHERITED`\
        \ - Indicates the ACE was inherited,\\n * `INHERIT_ONLY` - Indicates an inherit-only\
        \ ACE that doesn't control access to the attached object,\\n * `NO_PROPAGATE_INHERIT`\
        \ - Prevent subsequent children from inheriting ACE,\\n * `OBJECT_INHERIT`\
        \ - Non-container children inherit as effective ACE. Container objects inherit\
        \ as inherit-only ACE\"\n            }\n          },\n          \"result_ace\"\
        : {\n            \"description\": \"The new ACE produced by this step.\",\n\
        \            \"type\": \"object\",\n            \"properties\": {\n      \
        \        \"type\": {\n                \"type\": \"string\",\n            \
        \    \"enum\": [\n                  \"ALLOWED\",\n                  \"DENIED\"\
        \n                ],\n                \"description\": \"Type of this ACL\
        \ entry:\\n * `ALLOWED` - An ACL entry that grants rights,\\n * `DENIED` -\
        \ An ACL entry that denies rights\"\n              },\n              \"flags\"\
        : {\n                \"description\": \"ACE flags for this ACL entry\",\n\
        \                \"type\": \"array\",\n                \"items\": {\n    \
        \              \"type\": \"string\",\n                  \"enum\": [\n    \
        \                \"OBJECT_INHERIT\",\n                    \"CONTAINER_INHERIT\"\
        ,\n                    \"NO_PROPAGATE_INHERIT\",\n                    \"INHERIT_ONLY\"\
        ,\n                    \"INHERITED\",\n                    \"ACE_FLAGS_ALL\"\
        \n                  ],\n                  \"description\": \"ACE flags for\
        \ this ACL entry:\\n * `ACE_FLAGS_ALL` - All ACE flags,\\n * `CONTAINER_INHERIT`\
        \ - Children that are containers inherit as effective ACE,\\n * `INHERITED`\
        \ - Indicates the ACE was inherited,\\n * `INHERIT_ONLY` - Indicates an inherit-only\
        \ ACE that doesn't control access to the attached object,\\n * `NO_PROPAGATE_INHERIT`\
        \ - Prevent subsequent children from inheriting ACE,\\n * `OBJECT_INHERIT`\
        \ - Non-container children inherit as effective ACE. Container objects inherit\
        \ as inherit-only ACE\"\n                }\n              },\n           \
        \   \"trustee\": {\n                \"description\": \"Trustee for this ACL\
        \ entry\",\n                \"type\": \"object\",\n                \"properties\"\
        : {\n                  \"domain\": {\n                    \"type\": \"string\"\
        ,\n                    \"enum\": [\n                      \"LOCAL\",\n   \
        \                   \"API_NULL_DOMAIN\",\n                      \"WORLD\"\
        ,\n                      \"POSIX_USER\",\n                      \"POSIX_GROUP\"\
        ,\n                      \"ACTIVE_DIRECTORY\",\n                      \"API_INVALID_DOMAIN\"\
        ,\n                      \"API_RESERVED_DOMAIN\",\n                      \"\
        API_INTERNAL_DOMAIN\",\n                      \"API_OPERATOR_DOMAIN\",\n \
        \                     \"API_CREATOR_DOMAIN\"\n                    ],\n   \
        \                 \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n                  },\n                  \"auth_id\": {\n    \
        \                \"description\": \"auth_id\",\n                    \"type\"\
        : \"string\"\n                  },\n                  \"uid\": {\n       \
        \             \"description\": \"uid\",\n                    \"type\": \"\
        number\"\n                  },\n                  \"gid\": {\n           \
        \         \"description\": \"gid\",\n                    \"type\": \"number\"\
        \n                  },\n                  \"sid\": {\n                   \
        \ \"description\": \"sid\",\n                    \"type\": \"string\"\n  \
        \                },\n                  \"name\": {\n                    \"\
        description\": \"name\",\n                    \"type\": \"string\"\n     \
        \             }\n                }\n              },\n              \"rights\"\
        : {\n                \"description\": \"Rights granted or denied for this\
        \ ACL entry\",\n                \"type\": \"array\",\n                \"items\"\
        : {\n                  \"type\": \"string\",\n                  \"enum\":\
        \ [\n                    \"READ\",\n                    \"READ_EA\",\n   \
        \                 \"READ_ATTR\",\n                    \"READ_ACL\",\n    \
        \                \"WRITE_EA\",\n                    \"WRITE_ATTR\",\n    \
        \                \"WRITE_ACL\",\n                    \"CHANGE_OWNER\",\n \
        \                   \"WRITE_GROUP\",\n                    \"DELETE\",\n  \
        \                  \"EXECUTE\",\n                    \"MODIFY\",\n       \
        \             \"EXTEND\",\n                    \"ADD_FILE\",\n           \
        \         \"ADD_SUBDIR\",\n                    \"DELETE_CHILD\",\n       \
        \             \"SYNCHRONIZE\",\n                    \"ACCESS_RIGHTS_ALL\"\n\
        \                  ],\n                  \"description\": \"Rights granted\
        \ or denied for this ACL entry:\\n * `ACCESS_RIGHTS_ALL` - All access rights,\\\
        n * `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR` - Directory creation\
        \ access,\\n * `CHANGE_OWNER` - Owner write access,\\n * `DELETE` - Delete\
        \ access,\\n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE`\
        \ - Execute access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` -\
        \ File modification access,\\n * `READ` - File read access,\\n * `READ_ACL`\
        \ - ACL read access,\\n * `READ_ATTR` - Attribute read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR` - Attribute\
        \ write access,\\n * `WRITE_EA` - Extended attribute write access,\\n * `WRITE_GROUP`\
        \ - Group write access\"\n                }\n              }\n           \
        \ }\n          }\n        }\n      }\n    },\n    \"initial_acl\": {\n   \
        \   \"description\": \"The ACL originally on the file/directory in question.\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"control\"\
        : {\n          \"description\": \"control\",\n          \"type\": \"array\"\
        ,\n          \"items\": {\n            \"type\": \"string\",\n           \
        \ \"enum\": [\n              \"PRESENT\",\n              \"DEFAULTED\",\n\
        \              \"TRUSTED\",\n              \"AUTO_INHERIT\",\n           \
        \   \"PROTECTED\",\n              \"ACL_CONTROLS_ALL\"\n            ],\n \
        \           \"description\": \"control:\\n * `ACL_CONTROLS_ALL` - All ACL\
        \ controls,\\n * `AUTO_INHERIT` - Set whether the ACL was created through\
        \ inheritance,\\n * `DEFAULTED` - Sets whether the ACL was established by\
        \ default means,\\n * `PRESENT` - Set when ACL is present on the object,\\\
        n * `PROTECTED` - Protects ACL from inherit operations,\\n * `TRUSTED` - Set\
        \ when ACL is provided by a trusted source\"\n          }\n        },\n  \
        \      \"posix_special_permissions\": {\n          \"type\": \"array\",\n\
        \          \"items\": {\n            \"type\": \"string\",\n            \"\
        enum\": [\n              \"STICKY_BIT\",\n              \"SET_GID\",\n   \
        \           \"SET_UID\"\n            ],\n            \"description\": \"posix_special_permissions:\\\
        n * `SET_GID` - SET_GID,\\n * `SET_UID` - SET_UID,\\n * `STICKY_BIT` - STICKY_BIT\"\
        \n          }\n        },\n        \"aces\": {\n          \"type\": \"array\"\
        ,\n          \"items\": {\n            \"description\": \"aces\",\n      \
        \      \"type\": \"object\",\n            \"properties\": {\n            \
        \  \"type\": {\n                \"type\": \"string\",\n                \"\
        enum\": [\n                  \"ALLOWED\",\n                  \"DENIED\"\n\
        \                ],\n                \"description\": \"Type of this ACL entry:\\\
        n * `ALLOWED` - An ACL entry that grants rights,\\n * `DENIED` - An ACL entry\
        \ that denies rights\"\n              },\n              \"flags\": {\n   \
        \             \"description\": \"ACE flags for this ACL entry\",\n       \
        \         \"type\": \"array\",\n                \"items\": {\n           \
        \       \"type\": \"string\",\n                  \"enum\": [\n           \
        \         \"OBJECT_INHERIT\",\n                    \"CONTAINER_INHERIT\",\n\
        \                    \"NO_PROPAGATE_INHERIT\",\n                    \"INHERIT_ONLY\"\
        ,\n                    \"INHERITED\",\n                    \"ACE_FLAGS_ALL\"\
        \n                  ],\n                  \"description\": \"ACE flags for\
        \ this ACL entry:\\n * `ACE_FLAGS_ALL` - All ACE flags,\\n * `CONTAINER_INHERIT`\
        \ - Children that are containers inherit as effective ACE,\\n * `INHERITED`\
        \ - Indicates the ACE was inherited,\\n * `INHERIT_ONLY` - Indicates an inherit-only\
        \ ACE that doesn't control access to the attached object,\\n * `NO_PROPAGATE_INHERIT`\
        \ - Prevent subsequent children from inheriting ACE,\\n * `OBJECT_INHERIT`\
        \ - Non-container children inherit as effective ACE. Container objects inherit\
        \ as inherit-only ACE\"\n                }\n              },\n           \
        \   \"trustee\": {\n                \"description\": \"Trustee for this ACL\
        \ entry\",\n                \"type\": \"object\",\n                \"properties\"\
        : {\n                  \"domain\": {\n                    \"type\": \"string\"\
        ,\n                    \"enum\": [\n                      \"LOCAL\",\n   \
        \                   \"API_NULL_DOMAIN\",\n                      \"WORLD\"\
        ,\n                      \"POSIX_USER\",\n                      \"POSIX_GROUP\"\
        ,\n                      \"ACTIVE_DIRECTORY\",\n                      \"API_INVALID_DOMAIN\"\
        ,\n                      \"API_RESERVED_DOMAIN\",\n                      \"\
        API_INTERNAL_DOMAIN\",\n                      \"API_OPERATOR_DOMAIN\",\n \
        \                     \"API_CREATOR_DOMAIN\"\n                    ],\n   \
        \                 \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n                  },\n                  \"auth_id\": {\n    \
        \                \"description\": \"auth_id\",\n                    \"type\"\
        : \"string\"\n                  },\n                  \"uid\": {\n       \
        \             \"description\": \"uid\",\n                    \"type\": \"\
        number\"\n                  },\n                  \"gid\": {\n           \
        \         \"description\": \"gid\",\n                    \"type\": \"number\"\
        \n                  },\n                  \"sid\": {\n                   \
        \ \"description\": \"sid\",\n                    \"type\": \"string\"\n  \
        \                },\n                  \"name\": {\n                    \"\
        description\": \"name\",\n                    \"type\": \"string\"\n     \
        \             }\n                }\n              },\n              \"rights\"\
        : {\n                \"description\": \"Rights granted or denied for this\
        \ ACL entry\",\n                \"type\": \"array\",\n                \"items\"\
        : {\n                  \"type\": \"string\",\n                  \"enum\":\
        \ [\n                    \"READ\",\n                    \"READ_EA\",\n   \
        \                 \"READ_ATTR\",\n                    \"READ_ACL\",\n    \
        \                \"WRITE_EA\",\n                    \"WRITE_ATTR\",\n    \
        \                \"WRITE_ACL\",\n                    \"CHANGE_OWNER\",\n \
        \                   \"WRITE_GROUP\",\n                    \"DELETE\",\n  \
        \                  \"EXECUTE\",\n                    \"MODIFY\",\n       \
        \             \"EXTEND\",\n                    \"ADD_FILE\",\n           \
        \         \"ADD_SUBDIR\",\n                    \"DELETE_CHILD\",\n       \
        \             \"SYNCHRONIZE\",\n                    \"ACCESS_RIGHTS_ALL\"\n\
        \                  ],\n                  \"description\": \"Rights granted\
        \ or denied for this ACL entry:\\n * `ACCESS_RIGHTS_ALL` - All access rights,\\\
        n * `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR` - Directory creation\
        \ access,\\n * `CHANGE_OWNER` - Owner write access,\\n * `DELETE` - Delete\
        \ access,\\n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE`\
        \ - Execute access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` -\
        \ File modification access,\\n * `READ` - File read access,\\n * `READ_ACL`\
        \ - ACL read access,\\n * `READ_ATTR` - Attribute read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR` - Attribute\
        \ write access,\\n * `WRITE_EA` - Extended attribute write access,\\n * `WRITE_GROUP`\
        \ - Group write access\"\n                }\n              }\n           \
        \ }\n          }\n        }\n      }\n    },\n    \"result_acl\": {\n    \
        \  \"description\": \"The ACL that would be produced by applying the requested\
        \ mode.\",\n      \"type\": \"object\",\n      \"properties\": {\n       \
        \ \"control\": {\n          \"description\": \"control\",\n          \"type\"\
        : \"array\",\n          \"items\": {\n            \"type\": \"string\",\n\
        \            \"enum\": [\n              \"PRESENT\",\n              \"DEFAULTED\"\
        ,\n              \"TRUSTED\",\n              \"AUTO_INHERIT\",\n         \
        \     \"PROTECTED\",\n              \"ACL_CONTROLS_ALL\"\n            ],\n\
        \            \"description\": \"control:\\n * `ACL_CONTROLS_ALL` - All ACL\
        \ controls,\\n * `AUTO_INHERIT` - Set whether the ACL was created through\
        \ inheritance,\\n * `DEFAULTED` - Sets whether the ACL was established by\
        \ default means,\\n * `PRESENT` - Set when ACL is present on the object,\\\
        n * `PROTECTED` - Protects ACL from inherit operations,\\n * `TRUSTED` - Set\
        \ when ACL is provided by a trusted source\"\n          }\n        },\n  \
        \      \"posix_special_permissions\": {\n          \"type\": \"array\",\n\
        \          \"items\": {\n            \"type\": \"string\",\n            \"\
        enum\": [\n              \"STICKY_BIT\",\n              \"SET_GID\",\n   \
        \           \"SET_UID\"\n            ],\n            \"description\": \"posix_special_permissions:\\\
        n * `SET_GID` - SET_GID,\\n * `SET_UID` - SET_UID,\\n * `STICKY_BIT` - STICKY_BIT\"\
        \n          }\n        },\n        \"aces\": {\n          \"type\": \"array\"\
        ,\n          \"items\": {\n            \"description\": \"aces\",\n      \
        \      \"type\": \"object\",\n            \"properties\": {\n            \
        \  \"type\": {\n                \"type\": \"string\",\n                \"\
        enum\": [\n                  \"ALLOWED\",\n                  \"DENIED\"\n\
        \                ],\n                \"description\": \"Type of this ACL entry:\\\
        n * `ALLOWED` - An ACL entry that grants rights,\\n * `DENIED` - An ACL entry\
        \ that denies rights\"\n              },\n              \"flags\": {\n   \
        \             \"description\": \"ACE flags for this ACL entry\",\n       \
        \         \"type\": \"array\",\n                \"items\": {\n           \
        \       \"type\": \"string\",\n                  \"enum\": [\n           \
        \         \"OBJECT_INHERIT\",\n                    \"CONTAINER_INHERIT\",\n\
        \                    \"NO_PROPAGATE_INHERIT\",\n                    \"INHERIT_ONLY\"\
        ,\n                    \"INHERITED\",\n                    \"ACE_FLAGS_ALL\"\
        \n                  ],\n                  \"description\": \"ACE flags for\
        \ this ACL entry:\\n * `ACE_FLAGS_ALL` - All ACE flags,\\n * `CONTAINER_INHERIT`\
        \ - Children that are containers inherit as effective ACE,\\n * `INHERITED`\
        \ - Indicates the ACE was inherited,\\n * `INHERIT_ONLY` - Indicates an inherit-only\
        \ ACE that doesn't control access to the attached object,\\n * `NO_PROPAGATE_INHERIT`\
        \ - Prevent subsequent children from inheriting ACE,\\n * `OBJECT_INHERIT`\
        \ - Non-container children inherit as effective ACE. Container objects inherit\
        \ as inherit-only ACE\"\n                }\n              },\n           \
        \   \"trustee\": {\n                \"description\": \"Trustee for this ACL\
        \ entry\",\n                \"type\": \"object\",\n                \"properties\"\
        : {\n                  \"domain\": {\n                    \"type\": \"string\"\
        ,\n                    \"enum\": [\n                      \"LOCAL\",\n   \
        \                   \"API_NULL_DOMAIN\",\n                      \"WORLD\"\
        ,\n                      \"POSIX_USER\",\n                      \"POSIX_GROUP\"\
        ,\n                      \"ACTIVE_DIRECTORY\",\n                      \"API_INVALID_DOMAIN\"\
        ,\n                      \"API_RESERVED_DOMAIN\",\n                      \"\
        API_INTERNAL_DOMAIN\",\n                      \"API_OPERATOR_DOMAIN\",\n \
        \                     \"API_CREATOR_DOMAIN\"\n                    ],\n   \
        \                 \"description\": \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\\
        n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN`\
        \ - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\\
        n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\\
        n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n\
        \ * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` - POSIX_USER,\\n * `WORLD`\
        \ - WORLD\"\n                  },\n                  \"auth_id\": {\n    \
        \                \"description\": \"auth_id\",\n                    \"type\"\
        : \"string\"\n                  },\n                  \"uid\": {\n       \
        \             \"description\": \"uid\",\n                    \"type\": \"\
        number\"\n                  },\n                  \"gid\": {\n           \
        \         \"description\": \"gid\",\n                    \"type\": \"number\"\
        \n                  },\n                  \"sid\": {\n                   \
        \ \"description\": \"sid\",\n                    \"type\": \"string\"\n  \
        \                },\n                  \"name\": {\n                    \"\
        description\": \"name\",\n                    \"type\": \"string\"\n     \
        \             }\n                }\n              },\n              \"rights\"\
        : {\n                \"description\": \"Rights granted or denied for this\
        \ ACL entry\",\n                \"type\": \"array\",\n                \"items\"\
        : {\n                  \"type\": \"string\",\n                  \"enum\":\
        \ [\n                    \"READ\",\n                    \"READ_EA\",\n   \
        \                 \"READ_ATTR\",\n                    \"READ_ACL\",\n    \
        \                \"WRITE_EA\",\n                    \"WRITE_ATTR\",\n    \
        \                \"WRITE_ACL\",\n                    \"CHANGE_OWNER\",\n \
        \                   \"WRITE_GROUP\",\n                    \"DELETE\",\n  \
        \                  \"EXECUTE\",\n                    \"MODIFY\",\n       \
        \             \"EXTEND\",\n                    \"ADD_FILE\",\n           \
        \         \"ADD_SUBDIR\",\n                    \"DELETE_CHILD\",\n       \
        \             \"SYNCHRONIZE\",\n                    \"ACCESS_RIGHTS_ALL\"\n\
        \                  ],\n                  \"description\": \"Rights granted\
        \ or denied for this ACL entry:\\n * `ACCESS_RIGHTS_ALL` - All access rights,\\\
        n * `ADD_FILE` - File creation access,\\n * `ADD_SUBDIR` - Directory creation\
        \ access,\\n * `CHANGE_OWNER` - Owner write access,\\n * `DELETE` - Delete\
        \ access,\\n * `DELETE_CHILD` - Delete from directory access,\\n * `EXECUTE`\
        \ - Execute access,\\n * `EXTEND` - File extension access,\\n * `MODIFY` -\
        \ File modification access,\\n * `READ` - File read access,\\n * `READ_ACL`\
        \ - ACL read access,\\n * `READ_ATTR` - Attribute read access,\\n * `READ_EA`\
        \ - Extended attribute read access,\\n * `SYNCHRONIZE` - File synchronize\
        \ access,\\n * `WRITE_ACL` - ACL write access,\\n * `WRITE_ATTR` - Attribute\
        \ write access,\\n * `WRITE_EA` - Extended attribute write access,\\n * `WRITE_GROUP`\
        \ - Group write access\"\n                }\n              }\n           \
        \ }\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Explain the effect of setting a POSIX mode on a file/directory.
rest_endpoint: /v1/files/{ref}/info/acl/explain-set-mode
api_version: v1
permalink: /rest-api-guide/files/files_ref_info_acl_explain-set-mode.html
sidebar: rest_api_guide_sidebar
---