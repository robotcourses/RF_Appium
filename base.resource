*** Settings ***
## Bibliotecas
Library    AppiumLibrary  timeout=30
Library    String

## Biblioteca Customizada
Library    resources/libs/browserstack.py

## Variáveis
Variables    resources/locators/homeLocators.yaml
Variables    resources/locators/interestLocators.yaml
Variables    resources/locators/lookingForLocators.yaml
Variables    resources/locators/signInLocator.yaml
Variables    resources/locators/welcomeLocators.yaml
Variables    resources/locators/searchLocators.yaml
Variables    resources/locators/resultSearch.yaml

## Pages
Resource    resources/pages/homePage.resource
Resource    resources/pages/interestPage.resource
Resource    resources/pages/lookingForPage.resource
Resource    resources/pages/signInPage.resource
Resource    resources/pages/welcomePage.resource
Resource    resources/pages/searchPage.resource
Resource    resources/pages/resultSearchPage.resource

## Utils
Resource    resources/utils/openApp.resource
Resource    resources/utils/customKeywords.resource

*** Variables ***
${PLATFORM_NAME}   android
${DEVICE_NAME}     Google Pixel 7 Pro
${EMULATOR}        local    #local ou browserstack
${BROWSERSTACK_USER_NAME}        %{BROWSERSTACK_USER_NAME=${None}}
${BROWSERSTACK_ACCESS_KEY}       %{BROWSERSTACK_ACCESS_KEY=${None}}
${BROWSERSTACK_AUTHORIZATION}    %{BROWSERSTACK_AUTHORIZATION=${None}}
${BROWSERSTACK_PROJECT}          TED_ROBOTCOURSES
&{BROWSERSTACK_OPTIONS}          appiumVersion=2.0.1
${APP_DOWNLOAD_URL}              %{APP_DOWNLOAD_URL=${None}}