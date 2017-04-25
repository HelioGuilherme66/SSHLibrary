*** Settings ***
Force Tags  pybot   jybot
Resource        resources/common.robot
Library     SSHLibrary    WITH NAME SSH2    timeout=3 minutes 30 seconds    term_type=vt100    prompt=>>    path_separator=\\

*** Test Cases ***
Importing Library With Arguments
    [Setup]  SSH2.Open Connections
    ${conn}=  SSH2.Get Connections
    Should Be Equal As Integers  ${conn[0].timeout}  210
    Should Be Equal  ${conn[0].prompt}  >>
    Should Be Equal  ${conn[1].path_separator}  \\
    Should Be Equal As Integers  ${conn[1].timeout}  60
    Should Be Equal  ${conn[1].prompt}  >>
    Should Be Equal  ${conn[1].path_separator}  \\
    [Teardown]  SSH2.Close All Connections

*** Keywords ***
Open Connections
    SSH2.Open Connection  ${HOST}
    SSH2.Set Default Configuration  timeout=1 minute
    SSH2.Open Connection  ${HOST}
