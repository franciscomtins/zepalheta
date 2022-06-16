*** Settings ***
Documentation           Representação da página cliente com seus elementos e ações


*** Variables ***
${PAGINA_EQUIPO}        css:a[href$=register]  
${LABEL_NAME_EQ}        css:label[for="equipo-name"]  
${LABEL_DIARIA}         css:label[for="daily_price"]

*** Keywords ***
Registrar novo equipo
    [Arguments]     ${nome}     ${diaria}

    Input Text      id:equipo-name        ${nome} 
    Input Text      id:daily_price        ${diaria}

    Click Element   xpath://button[text()="CADASTRAR"]
