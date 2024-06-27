*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Select Interests
    [Arguments]
    ...  ${interestName}

    Wait Until Element Is Visible    ${interests.${PLATFORM_NAME}.interestList.format(param='${interestName}')}
    Click Element    ${interests.${PLATFORM_NAME}.interestList.format(param='${interestName}')}

    Wait Until Element Is Enabled    ${interests.nextButton}
    Click Element    ${interests.nextButton}