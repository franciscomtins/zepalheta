*** Settings ***
Documentation       Login Tentaviva

Resource            ${EXECDIR}/resources/base.robot

Test Template       Tentativa de login

Suite Setup          Iniciar Sessão
Suite Teardown       Encerrar Sessão

*** Keywords ***
Tentativa de login
    [Arguments]         ${input_email}      ${input_senha}      ${output_mensagem}

    Acesso a pagina Login
    Submeto minhas credenciais              ${input_email}      ${input_senha}   
    Devo ver um toaster com a mensagem      ${output_mensagem}

*** Test Case ***
Senha incorreta                 ${EMAIL}            abc123          Ocorreu um erro ao fazer login, cheque as credenciais. 
Senha em branco                 ${EMAIL}            ${EMPTY}        O campo senha é obrigatório!
E-mail em branco                ${EMPTY}            ${SENHA}        O campo email é obrigatório!   
E-mail e senha em branco        ${EMPTY}            ${EMPTY}        Os campos email e senha não foram preenchidos!  
login incorreto                 admin&gmail.com     abc123          Ocorreu um erro ao fazer login, cheque as credenciais. 

