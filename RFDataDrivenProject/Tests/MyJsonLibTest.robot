*** Settings ***
Documentation  Use this layer to get data from external files
Library  ../CustomLibs/jsonutil.py
Resource  ../Data/InputData.robot

*** Test Cases ***
JSON Example1 read fron json
    ${json_obj} =  Load JSON From File  ${JSON_FILE_PATH}
    log to console  ${json_obj}
    

JSON Example2 read a node value from json
    ${json_obj} =  Load JSON From File  ${JSON_FILE_PATH}
    ${datatype}=  evaluate  str(type($json_obj))
    log to console  ${datatype}
    log to console  ${json_obj['firstName']}

JSON Example3 update a node value in json
    ${json_obj} =  Load JSON From File  ${JSON_FILE_PATH}
    ${datatype}=  evaluate  str(type($json_obj))
    log to console  ${datatype}
    log to console  ${json_obj['firstName']}
    ${json_string}=  evaluate  json.dumps(${json_obj})    json
    Update Value To Json  ${json_string}  ${json_obj['firstName']}  Jane2
    
Add object to json ex
    ${json_obj} =  Load JSON From File  ${JSON_FILE_PATH}
    ${object_to_add}=	Create Dictionary	country=Thailand
    log to console  ${object_to_add}  
    ${json_obj} =  Add Object To Json	${json_obj}	 $['Phones'][2]  ${object_to_add}
    log to console  ${json_obj}
        
*** Keywords ***
Get JSON Data
    [Arguments]  ${FilePath}
    ${Data} =  Load JSON From File  ${FilePath}
    [Return]  ${Data}    