docker-compose run backend rake db:drop
docker-compose run backend rake db:create db:migrate db:seed
