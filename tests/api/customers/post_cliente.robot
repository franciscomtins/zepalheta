*** Settings ***                                                                                       
Resource        ${EXECDIR}/resources/services.robot


*** Test Cases *** 
Novo Cliente

    #&{payload}=         Create Dictionary   name=Jess H.    cpf=000.000.161-61  address=Rua 8   phone_number=85988997766
    ${payload}          Get json        custumers/Jess.json

    Delete custumer     ${payload['cpf']} 
    ${resp}=            Post custumer  ${payload}

    Status Should Be    200     ${resp}

Nome é obrigatorio

   #&{payload}=         Create Dictionary   cpf=000.000.161-61  address=Rua 8   phone_number=85988997766

    ${payload}          Get json       custumers/no_name.json
    ${resp}=            Post custumer  ${payload}

    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "name" is required

Cpf é obrigatorio

    #&{payload}=         Create Dictionary   name=Jess H.    address=Rua 8   phone_number=85988997766

    ${payload}          Get json       custumers/no_cpf.json 
    ${resp}=            Post custumer  ${payload}

    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "cpf" is required

Endereço é obrigatorio

    #&{payload}=         Create Dictionary   name=Jess H.    cpf=000.000.161-61  phone_number=85988997766

    ${payload}          Get json       custumers/no_address.json
    ${resp}=            Post custumer  ${payload}

    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "address" is required

Telefone é obrigatorio

    #&{payload}=         Create Dictionary   name=Jess H.    cpf=000.000.161-61  address=Rua 8

    ${payload}          Get json       custumers/no_phone.json
    ${resp}=            Post custumer  ${payload}

    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "phone_number" is required

