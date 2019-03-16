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

# Developing:

most of the relevant code resides in the ``/app`` folder, other important folder are ``/db`` for dabatase stuff and ``lib/assets`` for extra documents


Inside of the 
