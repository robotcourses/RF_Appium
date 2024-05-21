*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Click in Lets Go

    Wait Until Element Is Visible    ${welcome.nextButton}
    Click Element    ${welcome.nextButton}