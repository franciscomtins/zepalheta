*** Settings ***
Library         SeleniumLibrary
Library         libs/db.py

Resource        kws.robot
Resource        pages/ClientesPage.robot
Resource        pages/EquipoPage.robot
Resource        components/Slidebar.robot   
Resource        components/Toaster.robot 

*** Variables ***
${URL}          http://zepalheta-web:3000/      
${EMAIL}        admin@zepalheta.com.br
${SENHA}        pwd123
${BROWSER}      chrome

