*** Settings ***
Documentation       Representação do menu lateral de navegação da área locada

*** Variables ***
${NAVEGAR_CLIENTE}     css:a[href$=customers]     
${NAVEGAR_EQUIPO}      css:a[href="/equipos"]

*** Keywords ***
Go to clientes
    Wait Until Element Is Visible       ${NAVEGAR_CLIENTE}       5
    Click Element                       ${NAVEGAR_CLIENTE} 