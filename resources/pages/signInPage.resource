*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Skip Sing In

    Wait Until Element Is Visible    ${signIn.skipButton}
    Click Element    ${signIn.skipButton}