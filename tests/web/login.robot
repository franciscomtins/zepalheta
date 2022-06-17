*** Settings ***
Documentation       Login
Resource            ${EXECDIR}/resources/base.robot

Test Setup          Iniciar Sessão
Test Teardown       Encerrar Sessão

*** Test Cases ***
Login do Administrador
    Acesso a pagina Login
    Submeto minhas credenciais      ${EMAIL}        ${SENHA}  
    Devo ver a area logada


