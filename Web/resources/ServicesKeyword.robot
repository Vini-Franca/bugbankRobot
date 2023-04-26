*** Settings ***
Library     SeleniumLibrary
Resource    ../pages/bugbankMap.robot
Resource    ../resources/Config.robot

*** Keywords ***
Configura o browser
    Open Browser    ${URL}    ${BROWSER}  options=${CHROME_OPTIONS_SANDBOX}; ${CHROME_OPTIONS_WARNINGS}
    Maximize Browser Window

Voltar a home
    Go To    ${URL} 