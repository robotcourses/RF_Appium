*** Settings ***
Resource    ../../base.resource

*** Keywords ***
View Home
    
    Wait Until Element Is Visible    ${home.homeScreen}

Click In Browse Tab Icon

    Wait Visible And Click Element    ${home.discoverButton}