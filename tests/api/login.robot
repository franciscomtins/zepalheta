*** Settings ***                                                                                       
Resource        ${EXECDIR}/resources/services.robot

*** Test Cases ***                                                                                                                                                                                       
Login com sucesso                                                                                                                                                        
    ${resp}=            Post Session        admin@zepalheta.com.br      pwd123     
    Status Should Be    200    ${resp}

Senha incorreta         
    ${resp}=            Post Session        admin@zepalheta.com.br      abc123    
    Status Should Be    401    ${resp}

Usuário não existe                                                                                       
    ${resp}=            Post Session        404@zepalheta.com.br      abc123   
    Status Should Be    401    ${resp}


      