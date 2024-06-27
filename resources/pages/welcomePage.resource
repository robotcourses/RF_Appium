*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Click in Lets Go

    Wait Visible And Click Element    ${welcome.nextButton}