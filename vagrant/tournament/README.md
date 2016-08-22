# Tournament

## Description
Implementation of a Swiss-style tournament, using python and postgreSQL.

## tournament.sql
This file sets up the tournament database, players and matches tables, and helpful views.

## tournament.py
This python file provides an interface to CRUD commands in the database and methods for Swiss-style tournament matching.

## tournament_test.py
This file provides test methods for checking that tournament.py works as intended.

## Installation of VM environment
 1. install VirtualBox and Vagrant [as detailed here](https://udacity.atlassian.net/wiki/display/BENDH/Vagrant+VM+Installation)
 2. `git clone https://github.com/jdiii/fullstack-nanodegree-vm`.
 3. `cd PATH_TO_REPO/vagrant`
 3. Run `vagrant up` to install the VM

## Running the Tournament tests file
 1. In the PATH_TO_REPO/vagrant directory, run `vagrant ssh`
 2. Once connected to the VM, set up the 'tournament' database:
 	* In the VM, run `cd /vagrant/tournament`
 	* run `psql` to reach the PostgreSQL command prompt
	* In psql, type `\i tournament.sql`
 3. Run the tests with `python tournament_tests.py`
