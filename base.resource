*** Settings ***
## Carrega as variáveis do arquivo `.env`
Library    resources/lib/DotEnv.py

## Bibliotecas
Library    AppiumLibrary  timeout=30
Library    BrowserstackLibrary    username=%{BROWSERSTACK_USERNAME=${None}}  access_key=%{BROWSERSTACK_ACCESS_KEY=${None}}
Library    String

## Utils
Resource    resources/utils/openApp.resource
Resource    resources/utils/customKeywords.resource

## Locators
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

*** Variables ***
${PLATFORM_NAME}   android
${EMULATOR}        browserstack    #local ou browserstack
&{BROWSERSTACK_OPTIONS}          appiumVersion=2.0.1
${APP_DOWNLOAD_URL}              %{APP_DOWNLOAD_URL=${None}}