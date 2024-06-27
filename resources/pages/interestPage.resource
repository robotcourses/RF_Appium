*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Select Interests
    [Arguments]
    ...  ${interestName}

    Wait Visible And Click Element    ${interest.${PLATFORM_NAME}.interestList.format(text='${interestName}')}
    Wait Enabled And Click Element    ${interest.nextButton}