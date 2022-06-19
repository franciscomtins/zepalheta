*** Settings ***
Documentation           Representação da página contrato com seus elementos e ações


*** Variables ***
${PAGINA_CONTRATO}       css:a[href$=register]

*** Keywords ***
Criar novo contrato
    [Arguments]     ${customer_name}        ${equipo_name}
    
    Click Element       xpath://div[contains(text(), 'Escolha o locatário')]
    Click Element       xpath://div[contains(text(), '${customer_name}')]

    Click Element       xpath://div[contains(text(), 'Escolha o item')]
    Click Element       xpath://div[contains(text(), '${equipo_name}')]

    Input Text          id:delivery_price     10

    Input Text          id:quantity           1

    Click Element       css:button[type=submit]
    Click Element       xpath://button[text()='CADASTRAR']




