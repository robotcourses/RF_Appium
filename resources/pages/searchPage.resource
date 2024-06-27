*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Search Video
    [Arguments]    ${searchText}

    Wait Visible And Input Text    ${search.${PLATFORM_NAME}.searchInput}    ${searchText}

Select Search Video

    Wait Until Element Is Visible    ${search.${PLATFORM_NAME}.resultList}

    ${result}  Get Text    ${search.${PLATFORM_NAME}.resultList}
    ${speaker}  ${title}  Split String    ${result}    separator=:${SPACE}

    Set Test Variable    ${speaker}
    Set Test Variable    ${title}

    ##TODO    Problema no click do elemento, retirar o segundo click posteriormente
    Click Element    ${search.${PLATFORM_NAME}.resultList}
    Click Element    ${search.${PLATFORM_NAME}.resultList}