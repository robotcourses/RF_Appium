*** Settings ***
Resource      ../base.resource

*** Test Cases ***
Cenário: Acessar Surpreenda-me
    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click in Surprise Me