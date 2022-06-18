*** Settings ***                                                                                       
Resource        ${EXECDIR}/resources/services.robot


*** Test Cases *** 
Get clientes

    ${list}=        Get json  custumers/list.json

    FOR     ${item}     IN      @{list['data']}
        Post custumer  ${item}
    END

    ${resp}                 Get customers
    Status Should Be        200             ${resp}
    ${total}=               Get Length      ${resp.json()}
    Should Be True          ${total} > 0   
                

Get Um cliente
    ${origin}=          Get json  custumers/unique.json

    Delete custumer     ${origin['cpf']}
    ${resp}=            Post custumer           ${origin}
    ${use_id}=          Convert To String       ${resp.json()['id']}

    ${resp}=            Get unique customers   ${use_id}

    Status Should Be    200                        ${resp}
    Should Be Equal     ${resp.json()['cpf']}      ${origin['cpf']}

Cliente not found
    ${resp}             Get unique customers           698dc19d489c4e4db73e28a713eab07b
    Status Should Be    404                            ${resp}
    Should Be Equal     ${resp.json()['message']}      Customer not found