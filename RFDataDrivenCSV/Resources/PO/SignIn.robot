*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIGNIN_BTN} =  xpath=//a[contains(text(),'Log in')]
${SIGN_IN_EMAIL} =          id=login-email-name
${SIGN_IN_PASSWORD} =       id=login-email-password
${LOGIN_SUBMIT_BUTTON} =    xpath=//*[@id="login-email"]/div[3]/input

*** Keywords ***
Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}  ${LOGIN_URL}
    go to  ${SignInUrl}

Open signin form
    Wait Until Element Is Enabled    ${SIGNIN_BTN}
    Click Element  ${SIGNIN_BTN}
    
Enter Credentials
    [Arguments]  ${Credentials}
    run keyword unless  '${Credentials[0]}' == '#BLANK'  Input Text  ${SIGN_IN_EMAIL}  ${Credentials[0]}
    run keyword unless  '${Credentials[1]}' == '#BLANK'  Input Text  ${SIGN_IN_PASSWORD}  ${Credentials[1]}

Click Submit
    Click Button  ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage[2]}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_EMAIL}
    Clear Element Text  ${SIGN_IN_PASSWORD}