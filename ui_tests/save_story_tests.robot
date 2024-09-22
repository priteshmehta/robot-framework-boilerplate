*** Settings ***
Library  SeleniumLibrary
Resource          ../resources/page_helpers.robot

Test Setup       Perform User Sign In
Test Teardown    Close Browser

*** Variables ***
${STORY_CARDS_LIST}      css:article[class='FeedStoryCard_article-container__WzbBi']
${SAVE_STORY_BTN}           css:button[aria-label='Save Story']
${UNSAVE_STORY_BTN}           css:button[aria-label='Unsave Story']
${VIEW_SAVED_STORY_BTN}     css:a[aria-label='Saved Stories']

*** Keywords ***
Get First Story Card
    ${STORY_CARDS} =            Get WebElements     ${STORY_CARDS_LIST}
    ${STORY_CARD_FIRST} =       Set Variable    ${STORY_CARDS}[0]
    ${STORY_CARD_FIRST_TEXT} =  Get Text    ${STORY_CARD_FIRST}
    [Return]        ${STORY_CARD_FIRST_TEXT}

*** Test Cases ***
Verify User Can Save Story
    [Documentation]  Verify User Can Save Story
    [Tags]  UI-Functional
    Accept Cookies
    ${EXPECTED_SAVED_STORY} =       Get First Story Card
    Click Element       ${SAVE_STORY_BTN}
    Click Element       ${VIEW_SAVED_STORY_BTN}
    ${ACTUAL_SAVED_STORY} =       Get First Story Card
    Should Be Equal     ${ACTUAL_SAVED_STORY}   ${EXPECTED_SAVED_STORY}

Verify User Can Remove Saved Story
    [Documentation]  Verify User Can Remove Saved Story
    [Tags]  UI-Functional
    Accept Cookies
    ${EXPECTED_SAVED_STORY} =       Get First Story Card
    Click Element       ${SAVE_STORY_BTN}
    Click Element       ${VIEW_SAVED_STORY_BTN}
    Click Element       ${UNSAVE_STORY_BTN}
    Page Should Not Contain     ${EXPECTED_SAVED_STORY}



