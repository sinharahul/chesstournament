
1) execute this in postgres to enable rails model tests to run
ALTER USER myuser WITH SUPERUSER;

heroku run rake db:migrate

to recreate "heroku pg:reset DATABASE_URL"( drop and create not supported)

Shutdown postgres
1)su - postgres (marvel97)
2)/Library/PostgreSQL/9.5/pg_ctl -D /Library/PostgreSQL/9.5/data/ stop
heroku pg:psql