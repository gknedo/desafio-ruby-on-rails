# Sobre
Desafio prático da bycoders feito por Gustavo Canedo

# Requisitos
 - Docker
 - Docker Compose

# Executando o Projeto
Para configurar sua base de desenvolvimento ou resetá-la ao estado original, execute:
`docker-compose run backend setup`

Para executar os testes, após o setup, execute:
`docker-compose run backend rspec`

Para subir a aplicação, após o setup, execute:
`docker-compose up frontend`
O frontend estará em execução em http://localhost
Apesar de não necessário, o backend também está exposto em: http://localhost:3000
