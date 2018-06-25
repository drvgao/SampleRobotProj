*** Settings ***
Documentation  Use this layer to get data from external files
Library  ../CustomLibs/Csv.py
Resource  ../Data/InputData.robot

*** Test Cases ***
Should see correct error messages with invalid logins
    ${CsvData} =  Get CSV Data  ${CSV_FILE_PATH}
    log  ${CsvData}
    
*** Keywords ***
Get CSV Data
    [Arguments]  ${FilePath}
    ${Data} =  read csv file  ${FilePath}
    [Return]  ${Data}    