*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIGNIN_BTN} =  xpath=//a[contains(text(),'Log in')]
${SIGN_IN_EMAIL} =          id=login-email-name
${SIGN_IN_PASSWORD} =       id=login-email-password
${LOGIN_SUBMIT_BUTTON} =    xpath=//*[@id="login-email"]/div[3]/input

*** Keywords ***
Navigate To
    # ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}  ${LOGIN_URL}
    # go to  ${SignInUrl}
    go to  ${BASE_URL.${ENVIRONMENT}}

Enter Credentials
    [Arguments]  ${Credentials}
    run keyword unless  '${Credentials.Email}' == '#BLANK'  Input Text  ${SIGN_IN_EMAIL}  ${Credentials.Email}
    run keyword unless  '${Credentials.Password}' == '#BLANK'  Input Text  ${SIGN_IN_PASSWORD}  ${Credentials.Password}

Open signin form
    Wait Until Element Is Enabled    ${SIGNIN_BTN}
    Click Element  ${SIGNIN_BTN}
    
Click Submit
    Click Button  ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_EMAIL}
    Clear Element Text  ${SIGN_IN_PASSWORD}