# Sobre
Desafio prático da bycoders feito por Gustavo Canedo

# Executando o Projeto
## Requisitos
 - Docker
 - Docker Compose

## Setup
Para configurar sua base de desenvolvimento ou resetá-la ao estado original, execute:
`chmod +x setup.sh`
`./setup.sh`

## Testes
Para executar os testes e/ou verificar sua cobertura:
`docker-compose run backend rspec`

## Documentação da API
Para gerar uma documentação atualizada com base nos testes de aceitação:
`docker-compose run backend rake docs:generate`

## Executar a aplicação
Para subir a aplicação:
`docker-compose up frontend`

O frontend estará em execução em http://localhost
Apesar de não necessário, o backend também está exposto em: http://localhost:3000

# Considerações
## Desafios
Pontos que considerei desafiadores durante a execução do projeto:
- Gerar uma documentação da API baseada diretamente nos testes foi um aprendizado legal de algo que eu não havia feito antes.
- Toda a API foi feita com TDD e o servidor rails não foi iniciado em nenhum momento até o teste final. Toda a lógica e regras de negócio foram validadas somente com base nos testes. Não foi a primeira vez que fiz isto mas é sempre algo legal de ser comentado e um desafio pessoal que tento fazer em todos os meus projetos.

## Oportunidades de Melhoria
Pontos que poderiam ter sido feitos de uma forma mais elaborada para um projeto real e que pela falta de tempo não foram feitos nesse teste:
- Adicionar um serializer ou json_builder para não precisar sobrescrever o as_json das models para retornar atributos customizáveis no json.
- Melhorar a documentação para que ela tenha melhores exemplos do retorno esperado dos endpoints da API.
