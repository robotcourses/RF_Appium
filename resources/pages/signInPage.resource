*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Skip Sing In

    Wait Visible And Click Element    ${signIn.skipButton}