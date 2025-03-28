*** Settings ***
Resource    ../main.robot

*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CARD}      id:form-botao
${MENSAGEM_NOME_ERRO}    id:form-nome-erro
${MENSAGEM_CARGO_ERRO}   id:form-cargo-erro
${MENSAGEM_TIME_ERRO}    id:form-times-erro
@{selecionar_times} 
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')]
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação')]

*** Keywords ***
Dado que eu preencha os campos do formulário
        ${NOME}                        FakerLibrary.First Name
        Input Text                     ${CAMPO_NOME}             ${NOME}
        ${CARGO}                       FakerLibrary.job
        Input Text                     ${CAMPO_CARGO}            ${CARGO}
        ${IMAGEM}                      FakerLibrary.image_url
        Input Text                     ${CAMPO_IMAGEM}           ${IMAGEM}
        Click Element                  ${CAMPO_TIME}    
        Click Element                  ${selecionar_times}[0]

E clique no botão criar card
        Click Element                  ${CAMPO_CARD}

Então identificar o card no time esperado
        Element Should Be Visible      class:colaborador

Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que eu preencha os campos do formulário
        E clique no botão criar card
    END

Então criar e identificar 1 card em cada time disponível
    FOR    ${indece}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que eu preencha os campos do formulário
        Click Element    ${time}
        E clique no botão criar card
    END

Dado que eu clique no botão criar card
    Click Element    ${CAMPO_CARD}

Então sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    ${MENSAGEM_NOME_ERRO}
    Element Should Be Visible    ${MENSAGEM_CARGO_ERRO}
    Element Should Be Visible    ${MENSAGEM_TIME_ERRO}