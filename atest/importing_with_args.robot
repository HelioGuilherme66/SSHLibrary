*** Settings ***
Force Tags        pybot    jybot
Variables         resources/vars_server.py
Library           SSHLibrary    timeout=3 minutes 30 seconds    term_type=vt100    prompt=>>    path_separator=\\    WITH NAME    SSH

*** Test Cases ***
Importing Library With Arguments
    [Setup]    Open Connections
    ${conn}=    Get Connections
    Should Be Equal As Integers    ${conn[0].timeout}    210
    Should Be Equal    ${conn[0].prompt}    >>
    Should Be Equal    ${conn[1].path_separator}    \\
    Should Be Equal As Integers    ${conn[1].timeout}    60
    Should Be Equal    ${conn[1].prompt}    >>
    Should Be Equal    ${conn[1].path_separator}    \\
    [Teardown]    Close All Connections

*** Keywords ***
Open Connections
    Open Connection    ${HOST}
    Set Default Configuration    timeout=1 minute
    Open Connection    ${HOST}
