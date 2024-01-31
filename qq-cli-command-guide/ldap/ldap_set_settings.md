---
category: ldap
command: ldap_set_settings
keywords: qq, qq_cli, ldap_set_settings
optional_options:
- alternate: []
  help: Whether or not to enable the use of the LDAP server on the cluster.
  name: --use-ldap
  required: true
- alternate: []
  help: 'LDAP URI used to bind. Example: ldap://ldap-server.example.com'
  name: --bind-uri
  required: true
- alternate: []
  help: 'Base DNs (Distinguished Names). Separate multiple DNs using semicolons. Example:
    dc=account,dc=example,dc=com'
  name: --base-dn
  required: true
- alternate: []
  help: Binding users's DN. Default is empty.
  name: --bind-username
  required: false
- alternate: []
  help: Password for simple authentication against LDAP server. If not specified,
    will use password that is currently stored on disk.
  name: --bind-password
  required: false
- alternate: []
  help: If true, LDAP connection must be encrypted using TLS. Default is true.
  name: --encrypt-connection
  required: false
- alternate: []
  help: Use the standard schema defined in RFC2307. Cannot be combined with any custom
    schema arguments.
  name: --rfc2307
  required: false
- alternate: []
  help: The attribute on a group object which contains references to the members in
    that group.
  name: --custom-group-member-attribute
  required: false
- alternate: []
  help: The attribute on a user that the value of the group_member_attribute on a
    group refers to.
  name: --custom-user-group-identifier-attribute
  required: false
- alternate: []
  help: The attribute on a user that identifies their login name.
  name: --custom-login-name-attribute
  required: false
- alternate: []
  help: The attribute on a group that identifies their name.
  name: --custom-group-name-attribute
  required: false
- alternate: []
  help: The class of user objects.
  name: --custom-user-object-class
  required: false
- alternate: []
  help: The class of group objects.
  name: --custom-group-object-class
  required: false
- alternate: []
  help: The attribute on a user that identifies their uid number.
  name: --custom-uid-number-attribute
  required: false
- alternate: []
  help: The attribute on an object that identifies their gid number.
  name: --custom-gid-number-attribute
  required: false
permalink: /qq-cli-command-guide/ldap/ldap_set_settings.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq ldap_set_settings</code> command.
synopsis: Set settings for LDAP interaction
title: qq ldap_set_settings
usage: "qq ldap_set_settings [-h] --use-ldap {false,true} --bind-uri BIND_URI --base-dn\
  \ BASE_DN [--bind-username BIND_USERNAME]\n    [--bind-password BIND_PASSWORD] [--encrypt-connection\
  \ {false,true}] [--rfc2307]\n    [--custom-group-member-attribute CUSTOM_GROUP_MEMBER_ATTRIBUTE]\n\
  \    [--custom-user-group-identifier-attribute CUSTOM_USER_GROUP_IDENTIFIER_ATTRIBUTE]\n\
  \    [--custom-login-name-attribute CUSTOM_LOGIN_NAME_ATTRIBUTE] [--custom-group-name-attribute\
  \ CUSTOM_GROUP_NAME_ATTRIBUTE]\n    [--custom-user-object-class CUSTOM_USER_OBJECT_CLASS]\
  \ [--custom-group-object-class CUSTOM_GROUP_OBJECT_CLASS]\n    [--custom-uid-number-attribute\
  \ CUSTOM_UID_NUMBER_ATTRIBUTE] [--custom-gid-number-attribute CUSTOM_GID_NUMBER_ATTRIBUTE]"
zendesk_source: qq CLI Command Guide

---