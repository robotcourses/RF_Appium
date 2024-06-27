*** Settings ***
Resource      ../base.resource
Suite Setup    Send App To Browserstack
Test Setup     Open TED App
Test Teardown   Run Keywords
...    Send Test Status To Browserstack
...    Close Application

*** Test Cases ***
Cenário: Acessar TED sem Login

    Click in Lets Go
    Select Interests    Technology
    Select Looking For    Professional growth
    Skip Sing In
    View Home

Cenário: Realizar Pesquisa Por um Video

    Click in Lets Go
    Select Interests    Technology
    Select Looking For    Professional growth
    Skip Sing In
    View Home
    Click In Browse Tab Icon
    Search Video    Technology
    Select Search Video
    View Result Search