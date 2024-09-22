*** Variables ***
${SIGN_IN_URL}      https://signin.storyful.com/
${IMPLICIT_WAIT}    1  # Implicit wait time in seconds

${USER_EMAIL_TXTBOX}        id:user_email
${USER_PWD_TXTBOX}          id:user_password
${CAPTCHA_CHECKBOX}         id:recaptcha-anchor
${SIGN_IN_BTN}              id:send
${CAPTCHA_CONTAINER}        class:rc-anchor-center-container
${NEWSWIRE_LOGGED_SUCCESS_MSG}  gmail.com trial company
${USER_NAME}                    %{USER_NAME}
${PASSWORD}                     %{USER_PASSWORD}
${ACCEPT_BTN}               css:a[id='hs-eu-confirmation-button']

*** Keywords ***

Perform User Sign In
    Set Selenium Implicit Wait      ${IMPLICIT_WAIT}
    Open Browser    ${SIGN_IN_URL}  chrome
    Maximize Browser Window
    Wait Until Element Is Visible   ${SIGN_IN_BTN}   error=Sign In page failed to load
    Input Text          ${USER_EMAIL_TXTBOX}       ${USER_NAME}
    Input Text          ${USER_PWD_TXTBOX}         ${PASSWORD}
    Wait Until Page Contains Element    xpath://iframe[@title='reCAPTCHA']
    #Select Frame        xpath://iframe[@title='reCAPTCHA']
    #Wait Until Page Contains    ${CAPTCHA_CONTAINER}
    #Select Checkbox     ${CAPTCHA_CHECKBOX}
    #Sleep       120s
    #Click Element        ${CAPTCHA_CHECKBOX}
    #Unselect Frame
    Sleep                       20s
    Click Button                ${SIGN_IN_BTN}
    Wait Until Page Contains    ${NEWSWIRE_LOGGED_SUCCESS_MSG}

Accept Cookies
    Wait Until Element Is Visible   ${ACCEPT_BTN}
    Click Element                   ${ACCEPT_BTN}
