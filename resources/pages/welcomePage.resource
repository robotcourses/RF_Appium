*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Click In Lest Go
    
    Cancel Version Update
    Wait Visible And Click Element    ${welcome.nextButton}