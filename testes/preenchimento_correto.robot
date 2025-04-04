*** Settings ***
Resource         ../Resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado.
     Dado que eu preencha os campos do formulário
     E clique no botão criar card
     Então identificar o card no time esperado

*** Test Cases ***
Verificar se é possível criar mais de um card se preenchermos os campos corretamente.
    Dado que eu preencha os campos do formulário
    E clique no botão criar card
    Então identificar 3 cards no time esperado

Verificar se é possível criar um card para cada time se preenchermos os campos corretamente.
    Dado que eu preencha os campos do formulário
    Então criar e identificar 1 card em cada time disponível

# Fazendo este comentário apenas para testar o git.