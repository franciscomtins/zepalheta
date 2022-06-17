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
    E esse cliente não deve aparecer na lista
