***Settings ***
Documentation       Cadastro de clientes

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Logar na Sessão
Test Teardown       Encerrar Sessão


*** Test Case ***
Novo cliente
    Dado que acesso o formulario de cadastro de clientes
    Quando faco a inclusao desse cliente:
    ...     Fco Martins     00000014141     Rua dos Bugs, 1000          85999999999
    Entao devo ver a notificacao:   Cliente cadastrado com sucesso!     