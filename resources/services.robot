*** Settings ***
Documentation       Camada de serviços do projeto de automação

Library             Collections
Library             RequestsLibrary
Resource            helpers.robot            

*** Variables ***
${base_api_url}     http://zepalheta-api:3333 


*** Keywords ***
Get Session token
    ${resp}=        Post Session  admin@zepalheta.com.br  pwd123

    ${token}        Convert To String   Bearer ${resp.json()['token']}

    [return]        ${token}


Post Session
    [Arguments]     ${email}        ${password}

    Create Session    zp-api        ${base_api_url} 

    &{headers}=       Create Dictionary     Content-Type=application/json  
    &{payload}=       Create Dictionary     email=${email}     password=${password}                                                
                                                                                                       
    ${resp}=          Post Request      zp-api      /sessions       data=${payload}     headers=&{headers} 

    [return]          ${resp}   


Post custumer  
    [Arguments]     ${payload}

    Create Session      zp-api      ${base_api_url} 

    ${token}=           Get Session token
    &{headers}=         Create Dictionary   Content-Type=application/json   Authorization=${token}

    ${resp}=            Post Request        zp-api      /customers      data=${payload}     headers=${headers}

    [return]            ${resp}


Put custumer  
    [Arguments]     ${payload}      ${user_id}

    Create Session      zp-api      ${base_api_url} 

    ${token}=           Get Session token
    &{headers}=         Create Dictionary   Content-Type=application/json   Authorization=${token}

    ${resp}=            Put Request        zp-api      /customers/${user_id}      data=${payload}     headers=${headers}

    [return]            ${resp}


Get customers   
    Create Session      zp-api      ${base_api_url}

    ${token}=       Get Session token
    ${headers}=     Create Dictionary       Content-Type=application/json       Authorization=${token}
    
    ${resp}=        Get Request     zp-api      /customers      headers=${headers}
    [return]        ${resp}


Get unique customers 
    [Arguments]     ${user_id}

    Create Session      zp-api      ${base_api_url}

    ${token}=       Get Session token
    ${headers}=     Create Dictionary       Content-Type=application/json       Authorization=${token}
    
    ${resp}=        Get Request     zp-api      /customers/${user_id}           headers=${headers}
    [return]        ${resp}


Delete custumer
    [Arguments]     ${cpf}

    ${token}=           Get Session token
    &{headers}=         Create Dictionary   Content-Type=application/json   Authorization=${token}

     ${resp}=           Delete Request      zp-api      /customers/${cpf}        headers=${headers}

     [return]           ${resp}


Post equipos
    [Arguments]        ${payload}

    Create Session      zp-api                  ${base_api_url}

    ${token}=           Get Session token
    ${headers}=         Create Dictionary       Content-Type=application/json       Authorization=${token}

    ${resp}=            Post Request            zp-api      /equipos        data=${payload}     headers=${headers}

    [return]            ${resp}

