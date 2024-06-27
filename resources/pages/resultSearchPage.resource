*** Settings ***
Resource    ../../base.resource

*** Keywords ***
View Result Search

    Wait Until Element Is Visible    ${resultSearch.${PLATFORM_NAME}.cacheableImage}

    Element Should Contain Text    ${resultSearch.${PLATFORM_NAME}.videoTitle}    ${title}
    Element Should Contain Text    ${resultSearch.${PLATFORM_NAME}.videoSpeaker}    ${speaker}
