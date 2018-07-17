*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${transactionHistoryLink} =   Transaction History  #was TrxHistoryLinkText
${finTrxLinkClk} =  xpath=//li[2]/a/span/span[2]
${finTrx90DaysLink} =  xpath=//div[@id='transactionsFinancial']/div/div/div/div/label[3]
${Gmng90DaysLink} =  xpath=//div[@id='transactionsGame']/div/div/div/div/label[3]
${vrfyDebitCreditFld} =  xpath=//*[@id='transactionsFinancial']/div/div[2]/table/tbody/tr[1]/th[3]
${vrfyGamingFld} =  xpath=//*[@id='transactionsGame']/div/div[2]/table/tbody/tr/th[1]

*** Keywords ***
Navigate to transaction history
    [Arguments]  ${Credentials}
    Wait Until Element Is Visible    ${transactionHistoryLink}    
    Click Element    ${transactionHistoryLink}
    Wait Until Element Is Visible    ${Gmng90DaysLink}
    

Verify 90Days financial transactions
    Click Button  ${finTrxLinkClk}
    Wait Until Element Is Visible    ${finTrx90DaysLink}
    Click Button  ${finTrx90DaysLink}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage}

Verify debity transaction entry
    # TODO
    log  implement this later
    
Verify credit transaction entry    
    # TODO
    log  implement this later