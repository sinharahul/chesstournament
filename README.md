
1) execute this in postgres to enable rails model tests to run
ALTER USER myuser WITH SUPERUSER;

heroku run rake db:migrate

to recreate "heroku pg:reset DATABASE_URL"( drop and create not supported)
