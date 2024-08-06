*** Settings ***
Resource      ../base.resource

*** Test Cases ***
Cenário: Acessar Surpreenda-me
    [Tags]    c3
    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click in Surprise Me