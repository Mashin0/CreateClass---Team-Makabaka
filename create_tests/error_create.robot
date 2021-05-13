*** Settings ***
Documentation     A test suite containing tests related to failed to create.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.

Suite Setup       Open Browser To Create Class Page
Suite Teardown    Close Browser
Test Setup        Go To Create Class Page
Test Template     Create Class With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***                 Class Title      Description             Difficulty             Language
Empty Class Title                  ${EMPTY}         ${VALID DESCRIPTION}    ${VALID DIFFICULTY}    ${VALID LANGUAGE}
Empty Description                  ${VALID TITLE}   ${EMPTY}                ${VALID DIFFICULTY}    ${VALID LANGUAGE}
Empty Difficulty                   ${VALID TITLE}   ${VALID DESCRIPTION}    ${EMPTY}               ${VALID LANGUAGE}       
Empty Language                     ${VALID TITLE}   ${VALID DESCRIPTION}    ${VALID DIFFICULTY}    ${EMPTY}


*** Keywords ***

Create Class With Invalid Credentials Should Fail
    [Arguments]    ${classtitle}    ${description}   ${difficulty}   ${language}
    Input Class Title    ${classtitle}
    Input Description    ${description}
	Input Difficulty    ${difficulty}
	Input Language       ${language}
    Submit Credentials
    Create Class Should Have Failed
	
Create Class Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page