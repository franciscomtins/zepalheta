***Settings ***
Documentation       Cadastro de clientes

Resource            ${EXECDIR}/resources/base.robot

Test Setup         Logar na Sessão
Test Teardown      Encerrar Sessão


*** Test Case ***
Novo cliente
    Dado que acesso o formulario de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     Fco Martins     00000014141     Rua dos Bugs, 1000          85999999999    
    Quando faco a inclusao desse cliente
    Entao devo ver a notificacao:   Cliente cadastrado com sucesso!    

Cliente duplicado
    Dado que acesso o formulario de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     Adrian Smith     00000014141     Rua dos Bugs, 2000         11999999991  
    Mas esse cpf já existe no sistema
    Quando faco a inclusao desse cliente
    Entao devo ver a notificacao de erro:   Este CPF já existe no sistema!

Campos obrigatorios 
    Dado que acesso o formulario de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Quando faco a inclusao desse cliente
    Então devo ver msg informando que os campos do cadastro de clientes são obrigatorios

Nome é obrigatorio
    [Template]      Validação de campos
    ${EMPTY}        09747823004     Rua dos Bugs, 1000      85988889999     Nome é obrigatório

Cpf é obrigatorio
    [Template]      Validação de campos
    Fco Martins     ${EMPTY}        Rua dos Bugs, 1000      85988889999     CPF é obrigatório

Endereço é obrigatorio
    [Template]      Validação de campos           
    Fco Martins     09747823004     ${EMPTY}                85988889999     Endereço é obrigatório

Telefone é obrigatorio
    [Template]      Validação de campos      
    Fco Martins     09747823004     Rua dos Bugs, 1000      ${EMPTY}        Telefone é obrigatório

Telefone incorreto
    [Template]      Validação de campos
    Fco Martins     09747823004     Rua dos Bugs, 1000      8512345678      Telefone inválido    

*** Keywords ***
Validação de campos
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}     ${saida}

    Dado que acesso o formulario de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     ${nome}      ${cpf}     ${endereco}    ${telefone}
    Quando faco a inclusao desse cliente
    Então devo ver o texto:     ${saida} 
