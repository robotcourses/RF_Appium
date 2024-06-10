*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Select Interests
    [Arguments]
    ...  ${interestName}

    # ${element}  Replace Variables    ${interests.android.interestList}

    Wait Until Element Is Visible    ${interests.${PLATFORM_NAME}.interestList.format(param='${interestName}')}
    Click Element    ${interests.${PLATFORM_NAME}.interestList.format(param='${interestName}')}

    Click Element    ${interests.nextButton}