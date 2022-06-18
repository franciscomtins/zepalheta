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
                
