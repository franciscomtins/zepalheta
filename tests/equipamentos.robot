***Settings ***
Documentation       Cadastro de equipamentos

Resource            ${EXECDIR}/resources/base.robot

Test Setup         Logar na Sessão
Test Teardown      Encerrar Sessão

*** Test Cases ***
Novo equipamento
    Dado que acesso o formulario de cadastro de equipos
    E que tenho o seguinte equipo       Baixo     40
    Quando faco a inclusao desse equipo
    Entao devo ver a notificacao:    Equipo cadastrado com sucesso!

Campos obrigatorios
    Dado que acesso o formulario de cadastro de equipos
    E que tenho o seguinte equipo       ${EMPTY}      ${EMPTY} 
    Quando faco a inclusao desse equipo
    Então devo ver msg informando que os campos do cadastro de equipo são obrigatorios

Equipamento duplicado
    Dado que acesso o formulario de cadastro de equipos
    E que tenho o seguinte equipo       Triangulo  15
    Mas esse equipo já existe no sistema
    Quando faco a inclusao desse equipo
    Devo ver um toaster com a mensagem  Ocorreu um error na criação de um equipo, tente novamente mais tarde!
