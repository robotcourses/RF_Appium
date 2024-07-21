*** Settings ***
Resource      ../base.resource
Suite Setup    Send App To Browserstack
Test Setup     Open TED App
Test Teardown   Run Keywords
...    Send Test Status To Browserstack
...    Close Application

*** Test Cases ***
Cenário: Acessar TED sem Login
    Click In Lest Go
    Select Interest    Technology
    Select Looking For    Professional growth
    Skip Sing In
    View Home

Cenário: Realizar Pesquisa Por um Video
    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click In Browse Tab Icon
    Search Video    Technology
    Select Search Video
    View Result Search

Cenário: Acessar Surpreenda-me
    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click in Surprise Me