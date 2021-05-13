*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}             localhost:7272
${BROWSER}            Chrome
${DELAY}              0
${VALID TITLE}        Yoga
${VALID DESCRIPTION}  A Yoga Class Description
${VALID DIFFICULTY}   Beginner
${VALID LANGUAGE}     English
${EMPTY DIFFICULTY}  Please selcet
${EMPTY LANGUAGE}    Please selcet
${CREATE URL}         http://${SERVER}/createClass.html
${CREATED URL}        http://${SERVER}/classCreated.html
${ERROR URL}          http://${SERVER}/classCreationError.html


*** Keywords ***
Open Browser To Create Class Page
    Open Browser    ${CREATE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Create Class Page Should Be Open

Create Class Page Should Be Open
    Title Should Be    Create class

Go To Create Class Page
    Go To    ${CREATE URL}
    Create Class Page Should Be Open

Input Class Title
    [Arguments]    ${classtitle}
    Input Text    title_field    ${classtitle}

Input Description
    [Arguments]    ${description}
    Input Text    description_field    ${description}
	
Input Difficulty
    [Arguments]    ${difficulty} 	
	Run Keyword IF    "${difficulty}"!=""   Select From List By Label    difficulty_field    ${difficulty}    
	
Input Language
    [Arguments]    ${language} 
	Run Keyword IF    "${language}"!=""   Select From List By Label    language_field    ${language}

Submit Credentials
    Click Button    submit_button

Class Created Page Should Be Open
    Location Should Be    ${CREATED URL}
    Title Should Be    Result Page
	
Class Creation Error Page Should Be Open
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
