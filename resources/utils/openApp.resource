*** Settings ***
Resource  ../../base.resource

*** Variables ***
${app_path}  ${CURDIR}${/}..${/}app${/}app.apk

*** Keywords ***
Open TED App
        
    Open Application
    ...  remote_url=http://localhost:4723/wd/hub
    ...  automationName=UIAutomator2
    ...  platformName=${PLATFORM_NAME}
    ...  deviceName=${DEVICE_NAME}
    ...  app=${app_path}
    ...  autoGrantPermissions=${True}
    ...  disableIdLocatorAutocompletion=${True}
    ...  adbExecTimeout=30000