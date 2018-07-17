*** Settings ***
Documentation  Demonstrate a need for data-driven testing
Resource  ../../Resources/data/InputData.robot
Resource  ../../Resources/kws/Common.robot
Resource  ../../Resources/kws/HomePageKWs.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/Cars.robot

*** Variables ***

*** Test Cases ***
Login
    HomePageKWs.Navigate to Sign In Page
    HomePageKWs.Attempt Login  ${REGISTERED_USER}
Unregistered user should see correct error message at login
    HomePageKWs.Navigate to Sign In Page
    HomePageKWs.Attempt Login  ${UNREGISTERED_USER}
    HomePageKWs.Verify Login Page Error Message  ${UNREGISTERED_USER.ExpectedErrorMessage}

Login with invalid password should show correct error message
    HomePageKWs.Navigate to Sign In Page
    HomePageKWs.Attempt Login  ${INVALID_PASSWORD_USER}
    HomePageKWs.Verify Login Page Error Message  ${INVALID_PASSWORD_USER.ExpectedErrorMessage}

Login with blank email and password should show correct error message
    HomePageKWs.Navigate to Sign In Page
    HomePageKWs.Attempt Login  ${BLANK_CREDENTIALS_USER}
    HomePageKWs.Verify Login Page Error Message  ${BLANK_CREDENTIALS_USER.ExpectedErrorMessage}