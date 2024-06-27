*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Select Looking For
    [Arguments]
    ...  ${lookingForName}

    Wait Visible And Click Element    ${lookingFor.android.lookingForList.format(text='${lookingForName}')}
    Wait Enabled And Click Element    ${lookingFor.nextButton}