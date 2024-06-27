*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Select Looking For
    [Arguments]
    ...  ${lookingForName}

    Wait Until Element Is Visible    ${lookingFor.android.lookingForList.format(param='${lookingForName}')}
    Click Element    ${lookingFor.android.lookingForList.format(param='${lookingForName}')}

    Wait Until Element Is Enabled    ${lookingFor.nextButton}
    Click Element    ${lookingFor.nextButton}