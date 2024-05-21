*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Select Interests
    [Arguments]
    ...  ${interestName}

    ${element}  Replace Variables    ${interests.android.interestList}

    Wait Until Element Is Visible    ${element}
    Click Element    ${element}

    Click Element    ${interests.nextButton}