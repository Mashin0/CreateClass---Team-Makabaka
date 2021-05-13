*** Settings ***
Documentation     A test suite with a single test for valid create class.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Create

    Open Browser To Create Class Page
    Input Class Title    A Yoga Class Title
    Input Description    A Yoga Class Description
	Input Difficulty     Beginner
	Input Language       English
    Submit Credentials
    Class Created Page Should Be Open
    [Teardown]    Close Browser
