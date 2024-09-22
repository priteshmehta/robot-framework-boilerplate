*** Settings ***
Library  SeleniumLibrary
Resource          ../resources/page_helpers.robot

Test Setup       Perform User Sign In
Test Teardown    Close Browser

*** Variables ***
${LOCATOR_PICKER_BTN}               css:div[data-cy='location-filter-pill'] button
${LOCATOR_SEARCH_TXTBOX}        css:input[data-cy='location-search-field']
${LOCATOR_SEARCH_DATA_TEXT}        Ahmedabad
${LOCATOR_RESULT_DROP_DOWN}     css:div[data-cy='loc-search-popover']
${LOCATOR_RESULT_RESULT}        css:div[class='LocationFilter__SuggestItem-sc-1svny79-6 ketOUJ input-geo-suggestions-item']
${LOCATOR_APPLY_BTN}            css:div[id='buttons-container'] button


*** Keywords ***
Run Keyword Until Success
    [Arguments]     ${KW}   @{KWARGS}
    Wait Until Keyword Succeeds     5s     1s      ${KW}       @{KWARGS}

*** Test Cases ***
Verify Location Picker Result
    [Documentation]  Verify Location Picker works and searches result based on given filter
    [Tags]  UI-Functional
    Wait Until Page Contains    ${NEWSWIRE_LOGGED_SUCCESS_MSG}
    Click Element               ${LOCATOR_PICKER_BTN}
    Input Text                  ${LOCATOR_SEARCH_TXTBOX}        ${LOCATOR_SEARCH_DATA_TEXT}
    Wait Until Element Is Visible       ${LOCATOR_RESULT_DROP_DOWN}               error=Locator result failed to load
    Click Element               ${LOCATOR_RESULT_RESULT}
    Wait Until Element Is Visible       ${LOCATOR_APPLY_BTN}
    Click Element               ${LOCATOR_APPLY_BTN}
    #Sleep       2s
    Wait Until Page Contains        stories matching filters applied
    Page Should Contain             ${LOCATOR_SEARCH_DATA_TEXT}

