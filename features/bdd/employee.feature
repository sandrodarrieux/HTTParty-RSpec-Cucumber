# language: pt

Funcionalidade: Pesquisar Funcionarios
    Para averiguar informacoes
    O usuário do sistema
    Deseja poder consultar informacoes dos Funcionarios

    Cenario: Buscar informacoes de Funcionarios
        Dado que o usuario consulte informacoes de Funcionario
        Quando ele realizaar a pesquisa 
        Entao uma lista de funcionarios deve retornar 
        
    @cenario_dois
    Cenario: Cadastrar funcionario
        Dado que o usuario cadastre um novo funcionario
        Quando ele enviar as informacoes do funcionario
        Entao esse funcionario sera cadastrado

    @cenario_tres
    Cenario: Atualizar informacoes de funcionario
        Dado que o usuario atualize informacoes de um funcionario
        Quando ele enviar as novas informacoes
        Entao essas informacoes serao atualizadas

    @cenario_quatro
    Cenario: Deletar funcionario
        Dado que o usuario delete um funcionario
        Quando ele enviar a identificacao unica
        Entao esse funcionario sera deletado do sistema