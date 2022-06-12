***Settings ***
Documentation       Cadastro de clientes

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Logar na Sessão
Suite Teardown      Encerrar Sessão


*** Test Case ***
Novo cliente
    Dado que acesso o formulario de cadastro de clientes
    Quando faco a inclusao desse cliente:
    ...     Fco Martins     00000014141     Rua dos Bugs, 1000          85999999999
    Entao devo ver a notificacao:   Cliente cadastrado com sucesso!    

Campos obrigatorios 
    Dado que acesso o formulario de cadastro de clientes
    Quando faco a inclusao desse cliente:  
    ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Então devo ver msg informando que os campos do cadastro de clientes são obrigatorios

Nome é obrigatorio
    [Tags]          temp
    [Template]      Validação de coampos
    ${EMPTY}        09747823004     Rua dos Bugs, 1000      85988889999     Nome é obrigatório

Cpf é obrigatorio
    [Tags]          temp
    [Template]      Validação de coampos
    Fco Martins     ${EMPTY}        Rua dos Bugs, 1000      85988889999     CPF é obrigatório

Endereço é obrigatorio
    [Tags]          temp
    [Template]      Validação de coampos           
    Fco Martins     09747823004     ${EMPTY}                85988889999     Endereço é obrigatório

Telefone é obrigatorio
    [Tags]          temp
    [Template]      Validação de coampos      
    Fco Martins     09747823004     Rua dos Bugs, 1000      ${EMPTY}        Telefone é obrigatório

*** Keywords ***
Validação de coampos
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}     ${saida}

    Dado que acesso o formulario de cadastro de clientes
    Quando faco a inclusao desse cliente:  
    ...     ${nome}      ${cpf}     ${endereco}    ${telefone}
    Então devo ver o texto:     ${saida} 
