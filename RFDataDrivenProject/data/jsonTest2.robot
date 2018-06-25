*** Settings ***
Library  Collections

*** Variables ***
${MY_DATA_TABLE_VALUES_TEMP}  {"foo": "this is foo", "bar": "this is bar"}

*** Keywords ***
Converting a JSON File
    ${MY_DATA_TABLE_VALUES}    evaluate  json.loads('''${MY_DATA_TABLE_VALUES_TEMP}''')    json
    [Return]  ${MY_DATA_TABLE_VALUES}

*** Test Cases ***
Example
    ${data}=  converting a json file
    ${datatype}=  evaluate  str(type($data))
    # should be equal  ${datatype}  <type 'dict'>
    log to console  ${data['foo']}
    log to console  ${datatype}
    should be equal  ${data['foo']}  this is foo