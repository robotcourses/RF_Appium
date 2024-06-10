*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Select Looking For
    [Arguments]
    ...  ${lookingForName}

    # ${element}  Replace Variables    ${lookingFor.android.lookingForList}

    Wait Until Element Is Visible    ${lookingFor.android.lookingForList.format(param='${lookingForName}')}
    Click Element    ${lookingFor.android.lookingForList.format(param='${lookingForName}')}

    Click Element    ${lookingFor.nextButton}