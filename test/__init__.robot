*** Settings ***
Resource    ../base.resource
Suite Setup    Send App To Browserstack
Test Setup     Open TED App
Test Teardown   Run Keywords
...    Update Test Case Status in BrowserStack
...    Close Application

*** Keywords ***
Send App To Browserstack
    IF    '${EMULATOR}' == 'browserstack'
        Upload Application to Browserstack
        ...    app_name=ted.apk
        ...    app_path=${CURDIR}${/}..${/}resources${/}app${/}app.apk
        ...    custom_id=TED_OUVINTE_123
    END