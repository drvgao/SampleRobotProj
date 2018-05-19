*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN_BUTTON} =    xpath=//a[contains(text(),'Login')]
${SIGN_IN_USERNAME} =          id=loginModal-username
${SIGN_IN_PASSWORD} =       id=loginModal-password
${LOGIN_SUBMIT_BUTTON} =    Sign in

${title} =  Google
${IFL} =  btnI
${SEARCH_FIELD} =  lst-ib

*** Keywords ***
Navigate To
    ${BaseUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}  ${IGAMING_URL}
    go to  ${BaseUrl}
    Maximize Browser Window
    
Enter Credentials
    [Arguments]  ${Credentials}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    
    Click Element    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${SIGN_IN_USERNAME}
    Click Element  ${SIGN_IN_USERNAME}
    Input Text  ${SIGN_IN_USERNAME}  ${Credentials.User}
    Click Element  ${SIGN_IN_PASSWORD}
    Input Text  ${SIGN_IN_PASSWORD}  ${Credentials.Password}

Click Submit
    Click Button  ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_USERNAME}
    Clear Element Text  ${SIGN_IN_PASSWORD}