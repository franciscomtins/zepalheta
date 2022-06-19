*** Settings ***
Documentation       Cadastro de contratos de locação

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Logar na Sessão
Suite Teardown      Encerrar Sessão


*** Test Cases ***
Novo contrato de locacao
    Dado que eu tenho o seguinte cliente cadastrado:    tonha.json
    E este cliente deseja alugar o seguinte equipo:     meteoro.json
    E acesso o formulario de contratos
    Quando faço um novo contrato de locação
    Entao devo ver a notificacao:    Contrato criado com sucesso!

    Sleep               5

