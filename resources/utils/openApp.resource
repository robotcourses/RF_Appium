*** Settings ***
Resource  ../../base.resource

*** Variables ***
${app_path}  ${CURDIR}${/}..${/}app${/}app.apk

*** Keywords ***
Open TED App

    ${automation_name}  Define Appium Driver

    IF    '${EMULATOR}' == 'browserstack'

        Open Application
        ...  remote_url=http://${BROWSERSTACK_USER_NAME}:${BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com:80/wd/hub
        ...  automationName=${automation_name}
        ...  platformName=${PLATFORM_NAME}
        ...  deviceName=${DEVICE_NAME}
        ...  app=${bs['app_url']}
        ...  project=${BROWSERSTACK_PROJECT}
        ...  build=TED
        ...  name=${TEST_NAME}
        ...  bstack:options=${BROWSERSTACK_OPTIONS}
        ...  browserstack.networkLogs=${True}
        ...  browserstack.networkLogsOptions.captureContent=${True}
        ...  autoGrantPermissions=${True}
        ...  autoAcceptAlerts=${True}
        ...  disableIdLocatorAutocompletion=${True}
        ...  browserstack.idleTimeout=60
        ...  interactiveDebugging=${True}

    ELSE IF    '${EMULATOR}' == 'local'

        Open Application
        ...  remote_url=http://localhost:4723/wd/hub
        ...  automationName=${automation_name}
        ...  platformName=${PLATFORM_NAME}
        ...  deviceName=${DEVICE_NAME}
        ...  app=${app_path}
        ...  autoGrantPermissions=${True}
        ...  disableIdLocatorAutocompletion=${True}
        ...  adbExecTimeout=30000

    END

Send App To Browserstack
        IF    '${EMULATOR}' == 'browserstack'
            IF    '${APP_DOWNLOAD_URL}'
                ${bs}  Browserstack API
                ...    app_name=app.apk
                ...    app_path=${app_path}
                ...    auth=${BROWSERSTACK_AUTHORIZATION}
            ELSE
                ${bs}  Browserstack API
                ...    app_name=app.apk
                ...    app_path=${app_path}
                ...    auth=${BROWSERSTACK_AUTHORIZATION}
            END

            Set Suite Variable    ${bs} 
        END

Define Appium Driver

    IF    '${PLATFORM_NAME}' == 'android'
        RETURN  UIAutomator2
    ELSE IF    '${PLATFORM_NAME}' == 'ios'
        RETURN  XCUITest
    END