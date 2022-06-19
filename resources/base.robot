*** Settings ***
Library         SeleniumLibrary
Library         libs/db.py

Resource        kws.robot
Resource        pages/ClientesPage.robot
Resource        pages/ContratosPage.robot
Resource        pages/EquipoPage.robot
Resource        components/Slidebar.robot   
Resource        components/Toaster.robot 
Resource        services.robot

*** Variables ***
${URL}          http://zepalheta-web:3000/      
${EMAIL}        admin@zepalheta.com.br
${SENHA}        pwd123
${BROWSER}      chrome

