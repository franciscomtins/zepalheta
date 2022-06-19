*** Settings ***
Documentation           Representação da página cliente com seus elementos e ações


*** Variables ***
${PAGINA_CLIENTE}       css:a[href$=register]
${LABEL_NAME}           css:label[for=name]
${LABEL_CPF}            css:label[for=cpf]      
${LABEL_ADDRESS}        css:label[for=address]
${LABEL_PHONE}          css:label[for=phone_number]
${CLIENTE_LISTA}        css:table

*** Keywords ***
Registrar novo cliente
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}

    Reload Page

    Input Text      id:name             ${nome}  
    Input Text      id:cpf              ${cpf}  
    Input Text      id:address          ${endereco}
    Input Text      id:phone_number     ${telefone}
    
    Click Element   xpath://button[text()="CADASTRAR"]

Go to detalhes cliente
    [Arguments]     ${cpf_formatado}

    ${element}=      Set Variable        xpath://td[text()='${cpf_formatado}']

    Wait Until Element Is Visible        ${element}      5
    Click Element                        ${element}

Click apagar cliente 
    ${element}=     Set Variable        xpath://button[text()='APAGAR']

    Wait Until Element Is Visible      ${element}       5
    Click Element                      ${element}




