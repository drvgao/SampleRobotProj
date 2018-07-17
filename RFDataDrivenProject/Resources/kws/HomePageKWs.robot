*** Settings ***
Resource  ../PO/HomePagePO.robot

*** Keywords ***
Navigate to Sign In Page
    HomePagePO.Navigate To

Attempt Login
    [Arguments]  ${Credentials}
    HomePagePO.Enter Credentials  ${Credentials}
    HomePagePO.Click Submit
    Sleep  10s

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    HomePagePO.Verify Error Message  ${ExpectedErrorMessage}