*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com
${USER_ENDPOINT}  ${BASE_URL}/users

*** Test Cases ***
Get All Users
    [Documentation]   Retrieve the list of all users
    Create Session    my_session   ${BASE_URL}
    ${response}=      Get On Session    my_session  /users
    Status Should Be  200  ${response}
    Log To Console    ${response.json()}     # Print the response to console for verification

Create a New User
    [Documentation]   Create a new user and verify the response
    Create Session    my_session   ${BASE_URL}
    ${payload}=       Create Dictionary  name=John Doe  username=johndoe  email=johndoe@example.com
    ${response}=      Post On Session  my_session  /users  json=${payload}
    Status Should Be  201  ${response}
    Log To Console    ${response.json()}     # Print the response to console for verification

Get User By ID
    [Documentation]   Retrieve a specific user by ID
    Create Session    my_session   ${BASE_URL}
    ${user_id}=       Set Variable  1
    ${response}=      Get On Session  my_session  /users/${user_id}
    Status Should Be  200  ${response}
    Log To Console    ${response.json()}     # Print the response to console for verification

Update User By ID
    [Documentation]   Update an existing user and verify the response
    Create Session    my_session   ${BASE_URL}
    ${user_id}=       Set Variable  1
    ${payload}=       Create Dictionary  name=John Doe Updated  username=johndoe  email=johndoe@example.com
    ${response}=      Put On Session  my_session  /users/${user_id}  json=${payload}
    Status Should Be  200  ${response}
    Log To Console    ${response.json()}     # Print the response to console for verification

Delete User By ID
    [Documentation]   Delete a specific user by ID
    Create Session    my_session   ${BASE_URL}
    ${user_id}=       Set Variable  1
    ${response}=      Delete On Session  my_session  /users/${user_id}
    Status Should Be  200  ${response}
    Log To Console    User with ID ${user_id} deleted