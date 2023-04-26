*** Settings ***
Resource         ../steps/bugbankSteps.robot
Resource         ../resources/ServicesKeyword.robot
Resource         ../resources/BDDpt-br.robot
Test Teardown    Voltar a home
Suite Teardown   Close Browser

*** Test Cases ***

Cenário 01: Criar o primeiro usuário
    [Tags]    ct-001

    Dado que estou na página inicial do BugBank
    Quando clico em "REGISTRAR" e preencho as informações do primeiro usuário    
    Então vejo o número da conta e dígito do primeiro usuário

Cenário 02: Criar o segundo usuário
    [Tags]    ct-002

 ##   Dado que estou na página inicial do BugBank
    Quando clico em "REGISTRAR" e preencho as informações do segundo usuário    
    Então vejo o número da conta e dígito do segundo usuário

Cenário 03: Realizar uma transferência 
    [Tags]    ct-003

    Dado que estou logado com o primeiro usuário
    Quando acesso a página de transferência bancária e preencho os dados
    Então devo ver a mensagem "Transferencia realizada com sucesso"
    E devo verificar que o valor foi debitado da conta corrente