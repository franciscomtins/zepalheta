*** Settings ***
Documentation           Representação da página cliente com seus elementos e ações


*** Variables ***
${PAGINA_CLIENTE}       css:a[href$=register]
${LABEL_NAME}           css:label[for=name]
${LABEL_CPF}            css:label[for=cpf]      
${LABEL_ADDRESS}        css:label[for=address]
${LABEL_PHONE}          css:label[for=phone_number]

*** Keywords ***
Registrar novo cliente
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}

    Input Text      id:name             ${nome}  
    Input Text      id:cpf              ${cpf}  
    Input Text      id:address          ${endereco}
    Input Text      id:phone_number     ${telefone}
    
    Click Element   xpath://button[text()="CADASTRAR"]



