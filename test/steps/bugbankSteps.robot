*** Settings ***
Library     SeleniumLibrary   timeout=10s  run_on_failure=Capture Page Screenshot
Library     String
Resource    ../pages/bugbankMap.robot
Resource    ../resources/Config.robot
Resource    ../resources/ServicesKeyword.robot

*** Keywords ***
#### DADO
Que estou na página inicial do BugBank
    Configura o browser
    Title Should Be   ${TITLE}

#### E ###
Que estou logado com o primeiro usuário
    Wait Until Element Is Visible    ${CAMPO_EMAIL_LOGIN}     
    Input Text                       ${CAMPO_EMAIL_LOGIN}      ${EMAIL_USER01}
    Input Text                       ${CAMPO_SENHA_LOGIN}      ${SENHA_USER01}
    Click Button                     ${BTN_ACESSAR}        

Devo verificar que o valor foi debitado da conta corrente
    Wait Until Element Is Visible    ${BTN_FECHAR_TRANSF} 
    Click Element                    ${BTN_FECHAR_TRANSF} 
    Click Element                    ${BTN_VOLTAR_TRANSF}
    Click Element                    ${BTN_EXTRATO}   
    Wait Until Element Contains      ${CAMPO_DESCRICAO_EXTRATO}    ${DESCRICAO_TRANSFERENCIA} 
    Wait Until Element Contains      ${CAMPO_VALOR_TRANSFERENCIA_ENVIADA}    -R$ 500,00 
    
### ENTÃO ###
Vejo o número da conta e dígito do primeiro usuário
    Wait Until Element Is Visible    ${MSG_SUCESSO} 
    ${MENSAGEM}     Get Text         ${MSG_SUCESSO} 
    ${CONTA01}      Get Substring    ${MENSAGEM}    8    11
    ${DIGITO01}     Get Substring    ${MENSAGEM}    12   13
    Set Global Variable              ${DIGITO01}
    Set Global Variable              ${CONTA01}
    Log    ${CONTA01}
    Log    ${DIGITO01}

Vejo o número da conta e dígito do segundo usuário
    Wait Until Element Is Visible    ${MSG_SUCESSO} 
    ${MENSAGEM}     Get Text         ${MSG_SUCESSO} 
    ${CONTA02}      Get Substring    ${MENSAGEM}    8    11
    ${DIGITO02}     Get Substring    ${MENSAGEM}    12   13
    Set Global Variable              ${CONTA02}
    Set Global Variable              ${DIGITO02}
    Log    ${CONTA02}
    Log    ${DIGITO02}

Devo ver a mensagem "${MSG_SUCESSO}"   
    Wait Until Page Contains         ${MSG_SUCESSO}

#### QUANDO
Acesso a página de transferência bancária e preencho os dados
    Wait Until Element Is Visible    ${BTN_TRANSFERENCIA} 
    Click Element                    ${BTN_TRANSFERENCIA}
    Wait Until Element Is Visible    ${CAMPO_NUMERO_CONTA}   
    Input Text                       ${CAMPO_NUMERO_CONTA}          ${CONTA02} 
    Input Text                       ${CAMPO_NUMERO_DIGITO}         ${DIGITO02}
    Input Text                       ${CAMPO_VALOR_TRANSF}          ${VALOR_TRANSFERENCIA} 
    Input Text                       ${CAMPO_DESCRICAO_TRANSF}      ${DESCRICAO_TRANSFERENCIA} 
    Click Element                    ${BTN_TRANSFERERIR_AGORA} 
    
Clico em "REGISTRAR" e preencho as informações do primeiro usuário
    Wait Until Element Is Visible    ${BTN_REGISTRAR}  
    Click Button                     ${BTN_REGISTRAR}   
    Wait Until Element Is Visible    ${CAMPO_NOME} 
    Input Text                       ${CAMPO_NOME}               ${NOME_USER01}   
    Input Text                       ${CAMPO_EMAIL}              ${EMAIL_USER01}
    Input Text                       ${CAMPO_SENHA}              ${SENHA_USER01} 
    Input Text                       ${CAMPO_CONFIRM_SENHA}      ${SENHA_USER01} 
    Wait Until Page Contains Element   ${BTN_CRIAR_CONTA_SALDO} 
    Click Element                    ${BTN_CRIAR_CONTA_SALDO} 
    Click Element                    ${BTN_CADASTRAR} 
    
Clico em "REGISTRAR" e preencho as informações do segundo usuário
    Wait Until Element Is Visible    ${BTN_REGISTRAR}  
    Click Button                     ${BTN_REGISTRAR}   
    Wait Until Element Is Visible    ${CAMPO_NOME} 
    Input Text                       ${CAMPO_NOME}               ${NOME_USER02}   
    Input Text                       ${CAMPO_EMAIL}              ${EMAIL_USER02}      
    Input Text                       ${CAMPO_SENHA}              ${SENHA_USER02}
    Input Text                       ${CAMPO_CONFIRM_SENHA}      ${SENHA_USER02}
    Wait Until Page Contains Element  ${BTN_CRIAR_CONTA_SALDO} 
    Click Element                    ${BTN_CRIAR_CONTA_SALDO} 
    Click Element                    ${BTN_CADASTRAR} 
