*** Settings ***
Resource      ../base.resource
Test Setup    Open TED App
Test Teardown   Close Application

*** Test Cases ***
Cenário: Acessar TED sem Login

    Click in Lets Go
    Select Interests    Technology
    Select Looking For    Professional growth
    Skip Sing In
    View Home