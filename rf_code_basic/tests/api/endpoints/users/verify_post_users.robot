*** Settings ***
Resource    ../../../../testdata/variables/imports.resource
Resource    ../../../../keywords/imports.resource
Resource    ../../../../keywords/setupTeardowns.robot

Suite Setup    Authorize

Suite Teardown  Delete User    userId=${SUITE_USER_ID}

*** Variables ***
${SUITE_USER_ID}       ${EMPTY}

*** Test Cases ***
Verify Create New User
    Log To Console    \nSending Request To ${GLOBAL_ENDPOINT_USERS}\n
    ${id}  ${response}  Create New User
    Set Suite Variable   ${SUITE_USER_ID}  ${id}
    Validate Schema    inputJson=${response.json()}    referenceSchemaPath=${GLOBAL_SCHEMA_USER_POST}
    
