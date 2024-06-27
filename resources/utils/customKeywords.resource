*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Wait Until Element Is Enabled
    [Arguments]    ${locator}
    [Timeout]    10s

    WHILE    ${True}
        ${status}  Run Keyword And Return Status  Element Should Be Enabled    ${locator}
        Exit For Loop If    ${status}
    END

Wait Visible And Click Element
    [Arguments]    ${locator}

    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Wait Enabled And Click Element
    [Arguments]    ${locator}

    Wait Until Element Is Enabled    ${locator}
    Click Element    ${locator}

Wait Visible And Input Text
    [Arguments]    ${locator}    ${text}

    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}
    Is Keyboard Shown
    Input Text    ${locator}    ${text}

Swipe to Element
    [Arguments]  ${locator}

    ${start_x}  Set Variable  550
    ${start_y}  Set Variable  1260

    WHILE    ${True}    limit=NONE
        ${status}  Run Keyword And Return Status  Wait Until Element Is Visible    ${locator}

        IF    ${status}
            Exit For Loop
        ELSE
            ${offset_x}  Set Variable  ${${start_x} + 5}
        END

        Swipe
        ...    start_x=${start_x}
        ...    start_y=${start_y}
        ...    offset_x=${offset_x}
        ...    offset_y=0
    END

Send Test Status To Browserstack

    ${session_id}  Get Appium SessionId

    IF    '${EMULATOR}' == 'browserstack'
        Scenario Status
        ...  session_id=${session_id}
        ...  status=${TEST_STATUS}
        ...  reason=${TEST_MESSAGE}
        ...  auth=${BROWSERSTACK_AUTHORIZATION}
    END