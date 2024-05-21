*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Select Looking For
    [Arguments]
    ...  ${lookingForName}

    ${element}  Replace Variables    ${lookingFor.android.lookingForList}

    Wait Until Element Is Visible    ${element}
    Click Element    ${element}

    Click Element    ${lookingFor.nextButton}