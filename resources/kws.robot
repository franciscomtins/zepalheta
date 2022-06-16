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
    Wait Until Element Contains         ${TOASTER_ERROR_P}       ${expect_messagem}       5            

##Clientes
Dado que acesso o formulario de cadastro de clientes
    Wait Until Element Is Visible       ${NAVEGAR_CLIENTE}       5
    Click Element                       ${NAVEGAR_CLIENTE}  
    Wait Until Element Is Visible       ${PAGINA_CLIENTE}        5
    Click Element                       ${PAGINA_CLIENTE} 

E que eu tenho o seguinte cliente:
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}

    Remove cliente por cpf      ${cpf} 

    Set Test Variable       ${nome} 
    Set Test Variable       ${cpf} 
    Set Test Variable       ${endereco}
    Set Test Variable       ${telefone}

Quando faco a inclusao desse cliente
    Registrar novo cliente      ${nome}     ${cpf}      ${endereco}     ${telefone}

Mas esse cpf já existe no sistema
    Insert cliente      ${nome}     ${cpf}      ${endereco}     ${telefone}

Entao devo ver a notificacao: 
    [Arguments]     ${msg_esperada}

    Wait Until Element Contains         ${TOASTER_SUCESSO}      ${msg_esperada}     5

Entao devo ver a notificacao de erro: 
    [Arguments]     ${msg_esperada}

    Wait Until Element Contains         ${TOASTER_ERROR}        ${msg_esperada}     5

Então devo ver msg informando que os campos do cadastro de clientes são obrigatorios
    Wait Until Element Contains     ${LABEL_NAME}       Nome é obrigatório          5 
    Wait Until Element Contains     ${LABEL_CPF}        CPF é obrigatório           5 
    Wait Until Element Contains     ${LABEL_ADDRESS}    Endereço é obrigatório      5 
    Wait Until Element Contains     ${LABEL_PHONE}      Telefone é obrigatório      5 

Então devo ver o texto:
    [Arguments]     ${msg_esperada}

    Wait Until Page Contains        ${msg_esperada}             5  

### Keywords Cadastro equipos
Dado que acesso o formulario de cadastro de equipos
    Wait Until Element Is Visible       ${NAVEGAR_EQUIPO}       5
    Click Element                       ${NAVEGAR_EQUIPO}   
    Wait Until Element Is Visible       ${PAGINA_EQUIPO}        5
    Click Element                       ${PAGINA_EQUIPO}

E que tenho o seguinte equipo
    [Arguments]     ${nome}     ${diaria}

    Remove equipo por nome      ${nome}      

    Set Test Variable       ${nome} 
    Set Test Variable       ${diaria}

Quando faco a inclusao desse equipo
    Registrar novo equipo       ${nome}     ${diaria}

Então devo ver msg informando que os campos do cadastro de equipo são obrigatorios  
    Wait Until Element Contains     ${LABEL_NAME_EQ}    Nome do equipo é obrigatório        5
    Wait Until Element Contains     ${LABEL_DIARIA}     Diária do equipo é obrigatória      5

Mas esse equipo já existe no sistema
    Inserir Equipo      ${nome}     ${diaria}  

