*** Settings ***
Library     SSHLibrary  WITH NAME  SSH
Variables    vars_server.py

*** Variables ***
${USERNAME}               test
${PASSWORD}               test
# moved to vars_server.py ${HOST}                   192.168.2.15    # localhost
${PROMPT}                 $
${REMOTE TEST ROOT NAME}  robot-testdir
${REMOTE TEST ROOT}       /home/test/${REMOTE TEST ROOT NAME}
${CYGWIN HOME}            c:/cygwin64
${REMOTE WINDOWS TEST ROOT}  ${CYGWIN HOME}${REMOTE TEST ROOT}
${LOCAL TESTDATA}         ${CURDIR}${/}..${/}testdata

*** Keywords ***
Login As Valid User
    Open Connection  ${HOST}  prompt=${PROMPT}
    Login  ${USERNAME}  ${PASSWORD}

Remove Test Files And Close Connections
    Execute Command  rm -rf ${REMOTE TEST ROOT}
    Close All Connections