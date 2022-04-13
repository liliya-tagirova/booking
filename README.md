# README

create DB:

sudo -u postgres createdb booking_db
sudo -u postgres createdb test_booking_db
sudo -u postgres createdb prod_booking_db


to database.yml add:

development:
  adapter: postgresql
  database: booking_db
  pool: 5
  timeout: 5000
  user: postgres
test:
  adapter: postgresql
  database: test_booking_db
  pool: 5
  timeout: 5000
  user: postgres
production:
  adapter: postgresql
  database: prod_booking_db
  pool: 5
  timeout: 5000
  user: postgres


if error 
FATAL: Peer authentication failed for user "postgres"

to etc/postgresql/12/main/pg_hba.conf replace everything under these words:
# DO NOT DISABLE!
# If you change this first entry you will need to make sure that the
# database superuser can access the database using some other method.
# Noninteractive access to all databases is required during automatic
# maintenance (custom daily cronjobs, replication, and similar tasks).
#
# Database administrative login by Unix domain socket

to:

local  all       postgres                trust
# TYPE DATABASE    USER      ADDRESS         METHOD
# "local" is for Unix domain socket connections only
local  all       all                   trust
# IPv4 local connections:
host  all       all       127.0.0.1/32      trust
# IPv6 local connections:
host  all       all       ::1/128         trust
# Allow replication connections from localhost, by a user with the
# replication privilege.
local  replication   all                   peer
host  replication   all       127.0.0.1/32      md5
host  replication   all       ::1/128         md5


and restart your database

sudo service postgresql restart

