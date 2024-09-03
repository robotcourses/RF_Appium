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

Swipe Until Element Is Visible
    [Arguments]    ${locator}
    
    ${x}  Get Window Width
    ${y}  Get Window Height

    ${start_x}  Evaluate  ${x} / 2
    ${start_y}  Evaluate  ${y} / 2

    WHILE    ${True}
        ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}  1

        IF    ${status}
            Exit For Loop
        END

        Swipe    
        ...    start_x=${start_x}
        ...    start_y=${start_y}
        ...    offset_x=${start_x}
        ...    offset_y=0
    END

Access TED APP Without Login
    [Arguments]    ${interest}    ${lookingFor}

    Click In Lest Go
    Select Interest    ${interest}
    Select Looking For    ${lookingFor}
    Skip Sing In
    View Home

Send App To Browserstack
    IF    '${EMULATOR}' == 'browserstack'
        Upload Application to Browserstack
        ...    app_name=ted.apk
        ...    app_path=${CURDIR}${/}..${/}app${/}app.apk
        ...    custom_id=TED_OUVINTE_123
    END

Cancel Version Update

    ${deniedButton}  Set Variable  //android.widget.Button[@resource-id="android:id/button2"]
    ${status}  Run Keyword And Return Status    Wait Until Element Is Visible    ${deniedButton}  timeout=3

    IF    ${status}
        Wait Visible And Click Element    ${deniedButton}
    END