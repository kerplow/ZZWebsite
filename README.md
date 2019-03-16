# README

This README would normally document whatever steps are necessary to get the
application up and running.

# Rails installation

gorails.com/setup/ (for the database setup part, pick postgresql)

# Setup:

* download the code from github.com/kerplow/ZZWebsite to a local folder (remember where)

* open a terminal and navigate to the folder:
1) ``ls`` to see folder contents
2) ``cd`` (short for change directory) to navigate to the correct folder (``cd ..`` to go up one folder again)

example: ``cd documents/code/kerplow/ZZW``

* setup dependencies: run``bundle install``

* setup database: run ``rails db:create db:migrate db:seed``

# running the server:

* ``rails s`` (short for rails server) to run the server, ctrl-c/cmnd-c to shut it down

* ``rails c`` (short for rails console) to run an interactive console to test backend code

* ``rails dbconsole`` to access a sql console and manipulate the database (here there be dragons)

* go to ``localhost:3000`` in any browser (chrome works best for frontend development)

# Ruby on Rails:

Rails contains a whole bunch of folders to contain configuration and behind the screens stuff, but most of them are not important.
The relevant ones are:

1) ``/app``: This is where **all** of the frontend and most of the backend code resides
2) ``/lib/assets`` for documents and relevant info (ex: opruimlijst)
3) ``/db``: this contains all database files and has 2 main parts:
* ``/migrations``: this folder contains the migration files that are run in sequence to create, setup and incrementally adjust the database, the end result of this will be: 
* ``schema.rb`` Here you can see an overview of the database tables and columns
4) ``/config``  contains a whole bunch of configuration files (whodathunk!) of which ``routes.rb`` is the most interesting one. Here you can define urls and where they point to.

# Frontend in RoR:

Inside of the ``/app`` folder are (again) a whole bunch of folders
