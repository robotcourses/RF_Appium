*** Settings ***
Resource    ../../base.resource

*** Keywords ***
View Home
    
    Wait Until Element Is Visible    ${home.homeScreen}