*** Settings ***                                                                                       
Resource        ${EXECDIR}/resources/services.robot


*** Test Cases *** 
Update cliente

    ${payload}=         Get json    custumers/mara.json

    Delete custumer     ${payload['cpf']}
    ${resp}=            Post custumer           ${payload}
    ${user_id}=         Convert To String       ${resp.json()['id']}

    Set to Dictionary   ${payload}      name        Saul Hudson

    ${resp}             Put custumer    ${payload}    ${user_id}
    Status Should Be    204              ${resp}  

    ${resp}             Get unique customers          ${user_id}
    Should Be Equal     ${resp.json()['name']}        Saul Hudson