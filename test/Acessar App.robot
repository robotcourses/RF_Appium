*** Settings ***
Resource      ../base.resource

*** Test Cases ***
Cenário: Acessar TED sem Login
    [Tags]    login
    
    Click In Lest Go
    Select Interest    Technology
    Select Looking For    Professional growth
    Skip Sing In
    View Home