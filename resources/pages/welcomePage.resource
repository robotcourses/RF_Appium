*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Click In Lest Go

    Sleep  2
    Wait Visible And Click Element    ${welcome.nextButton}