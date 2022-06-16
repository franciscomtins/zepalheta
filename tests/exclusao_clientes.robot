***Settings ***
Documentation       Cadastro de clientes

Resource            ${EXECDIR}/resources/base.robot

Test Setup         Logar na Sessão
Test Teardown      Encerrar Sessão


*** Test Case ***
Remover cliente
    Dado que eu tenha um cliente indesejado:
    ...     Bob Dylan       33333333333     Rua dos Bugs, 2000      21988888888  
    E acesso a lista de clientes
    Quando eu removo esse cliente
    Entao devo ver a notificacao:   Cliente removido com sucesso!

*** Keywords ***
Dado que eu tenha um cliente indesejado:
    [Arguments]                 ${nome}     ${cpf}      ${endereco}     ${telefone}
    Remove cliente por cpf      ${cpf} 
    Insert cliente              ${nome}     ${cpf}      ${endereco}     ${telefone}

E acesso a lista de clientes
    Go to clientes

Quando eu removo esse cliente
    Wait Until Element Is Visible       xpath://td[text()='333.333.333-33']     5
    Click Element                       xpath://td[text()='333.333.333-33']
    Wait Until Element Is Visible       xpath://button[text()='APAGAR']         5
    Click Element                       xpath://button[text()='APAGAR']