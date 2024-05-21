*** Settings ***
## Bibliotecas
Library      AppiumLibrary  timeout=30 

## Variáveis
Variables    resources/locators/homeLocators.yaml
Variables    resources/locators/interestsLocators.yaml
Variables    resources/locators/lookingForLocators.yaml
Variables    resources/locators/signInLocator.yaml
Variables    resources/locators/welcomeLocators.yaml

## Pages
Resource    resources/pages/homePage.resource
Resource    resources/pages/interests.resource
Resource    resources/pages/lookingForPage.resource
Resource    resources/pages/signInPage.resource
Resource    resources/pages/welcomePage.resource

## Utils
Resource    resources/utils/openApp.resource

*** Variables ***
${PLATFORM_NAME}  android
${DEVICE_NAME}    Google Pixel 7