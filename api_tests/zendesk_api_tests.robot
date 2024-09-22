*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}=       https://z3npm-social.zendesk.com
${TICKET_ENDPOINT}=  ${BASE_URL}/api/v2/tickets.json
${BASIC_AUTH_TOKEN}=  %{USER_AUTH_TOKEN}
&{header}=          Authorization=Basic ${BASIC_AUTH_TOKEN}      Content-Type=application/json
${TICKET_BODY}=   {"ticket": {"subject": "Pritesh Printer offline","comment": { "body": "My printer is offline. Restarting doesn’t help." }}}

# Request Methods
${GET}=                 Get Request
${POST}=                Post Request
${PUT}=                 Put Request

# Response Codes
${CODE_OK} =             200
${CODE_ITEM_CREATED} =        201
${CODE_BAD_REQUEST} =    400
${CODE_UNAUTHORIZED} =   401
${CODE_NOT_FOUND} =      404
${CODE_SERVER_ERROR} =   500

*** Keywords ***

*** Test Cases ***
Get Tickets
    [Documentation]   Create ticket
    [Tags]   API
    Create Session    my_session   ${BASE_URL}   headers=${header}       verify=${false}
    ${response}=      Get On Session    my_session  ${TICKET_ENDPOINT}
    Status Should Be  ${CODE_OK}  ${response}
    Log To Console    ${response.json()}

Create Tickets
    [Documentation]   Create ticket
    [Tags]   API
    Create Session    my_session   ${BASE_URL}   headers=${header}       verify=${false}
    ${response}=      Post On Session    my_session  ${TICKET_ENDPOINT}   data=${TICKET_BODY}
    Status Should Be  ${CODE_ITEM_CREATED}  ${response}
    Log To Console    ${response.json()}

