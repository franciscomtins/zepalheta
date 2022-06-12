*** Settings ***
Documentation   Ações compartilhadas

*** Keywords  ***

##login
Iniciar Sessão
    Open Browser        about:blank     ${BROWSER} 
    Maximize Browser Window    

Encerrar Sessão
    Close Browser 

Acesso a pagina Login
    Go To       ${URL}     

Logar na Sessão
    Iniciar Sessão
    Acesso a pagina Login
    Submeto minhas credenciais      ${EMAIL}    ${SENHA} 

Submeto minhas credenciais
    [Arguments]     ${email_arg}        ${senha_arg}

    Input Text          id:txtEmail                         ${email_arg}
    Input Text          css:input[placeholder="Senha"]      ${senha_arg}      
    Click Element       xpath://button[text()="Entrar"] 

Devo ver a area logada
    Wait Until Page Contains    Aluguéis    10

Devo ver um toaster com a mensagem
    [Arguments]     ${expect_messagem}    
    Wait Until Element Contains         ${TOASTER_ERROR}       ${expect_messagem}       5            

##Clientes
Dado que acesso o formulario de cadastro de clientes
    Wait Until Element Is Visible       ${NAVEGAR_CLIENTE}       5
    Click Element                       ${NAVEGAR_CLIENTE}  
    Wait Until Element Is Visible       ${PAGINA_CLIENTE}        5
    Click Element                       ${PAGINA_CLIENTE} 

Quando faco a inclusao desse cliente:
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}

    Remove cliente por cpf      ${cpf} 

    Registrar novo cliente      ${nome}     ${cpf}      ${endereco}     ${telefone}

Entao devo ver a notificacao: 
    [Arguments]     ${msg_esperada}

    Wait Until Element Contains         ${TOASTER_SUCESSO}      ${msg_esperada}     5 

Então devo ver msg informando que os campos do cadastro de clientes são obrigatorios
    Wait Until Page Contains        Nome é obrigatório          5 
    Wait Until Page Contains        CPF é obrigatório           5 
    Wait Until Page Contains        Endereço é obrigatório      5 
    Wait Until Page Contains        Telefone é obrigatório      5 

Então devo ver o texto:
    [Arguments]     ${msg_esperada}

    Wait Until Page Contains        ${msg_esperada}             5  