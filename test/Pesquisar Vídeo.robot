*** Settings ***
Resource      ../base.resource

*** Test Cases ***
Cenário: Realizar Pesquisa Por um Video
    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click In Browse Tab Icon
    Search Video    Technology
    Select Search Video
    View Result Search
