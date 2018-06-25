*** Settings ***
Library         REST    https://jsonplaceholder.typicode.com
Documentation   The test data can be read from files, strings or dicts.
...             The validation keywords correspond to the JSON types.
...             They take in either a plain text path or a JSONPath.
...             Optionally type specific JSON Schema validations can be used.
...             You can optionally check for constant JSON values too.
...             Every request creates an instance. Can be output as JSON.
...             The validations are effective for the last created instance.
...             The scope of the created instances is this test suite.


*** Variables ***
${json}         { "id": 11, "name": "Gil Alexander" }
&{dict}         name=Julie Langford


*** Test Cases ***
GET an existing user
    GET         /users/1                  # this creates a new instance
    Object      response body
    Integer     response body id          1
    String      response body name        Leanne Graham   # quotes optional
    [Teardown]  Output                    # the current instance

GET existing users, JSONPath can be used
    GET         /users?_limit=5           # this is now the last instance
    Array       response body
    Integer     $[0].id                   1           # first id is 1
    String      $[0]..lat                 -37.3159    # any matching child
    Integer     $..id                     maximum=5   # multiple matches
    [Teardown]  Output  $[*].id           # all ids as a JSON array

POST with valid params to create an user
    POST        /users                    ${json}
    Integer     response status           201
    [Teardown]  Output                    # file_path=${OUTPUTDIR}/inst.json

PUT with valid params to update existing
    PUT         /users/2                  { "isCoding": true }
    Boolean     response body isCoding    true
    PUT         /users/2                  { "sleep": null }
    Null        response body sleep
    PUT         /users/2                  { "pockets": "", "money": 0.02 }
    String      response body pockets     ${EMPTY}
    Number      response body money       0.02
    Missing     response body moving

PATCH with valid params, use response further as a new payload
    &{res}=     GET   /users/3
    String      $.name                    Clementine Bauch
    PATCH       /users/4                  { "name": "${res.body['name']}" }
    String      $.name                    Clementine Bauch
    PATCH       /users/5                  ${dict}
    String      $.name                    ${dict.name}

DELETE existing successfully
    DELETE      /users/6
    Integer     response status           200    202     204
    Rest instances   ${OUTPUTDIR}/all_cases.json   # all instances so far