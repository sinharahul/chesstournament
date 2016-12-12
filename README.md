
1) execute this in postgres to enable rails model tests to run
ALTER USER myuser WITH SUPERUSER;

heroku run rake db:migrate

to recreate "heroku pg:reset DATABASE_URL"( drop and create not supported)

Shutdown postgres
1)su - postgres (marvel97)
2)/Library/PostgreSQL/9.5/pg_ctl -D /Library/PostgreSQL/9.5/data/ stop
heroku pg:psql

TODOS
1)Add tests

Running tests
1)Run ALL TESTS :We can run all of our tests at once by using the bin/rails test command.
2)run specific tests  bin/rails test test/models/article_test.rb -n test_the_truth
