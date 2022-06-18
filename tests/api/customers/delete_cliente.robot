*** Settings ***                                                                                       
Resource        ${EXECDIR}/resources/services.robot


*** Test Cases *** 
Delete cliente
    ${origin}=          Get json  custumers/chimbinha.json

    Delete custumer     ${origin['cpf']}
    ${resp}=            Post custumer                   ${origin}

    ${resp}=            Delete custumer                 ${origin['cpf']}

    Status Should Be    204                             ${resp}

Cliente not found
    ${resp}             Delete custumer                594.915.850-45
    Status Should Be    404                            ${resp}
    Should Be Equal     ${resp.json()['message']}      Customer not found