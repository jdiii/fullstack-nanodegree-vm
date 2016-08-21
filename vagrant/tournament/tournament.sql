-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS players;
DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;
\c tournament;

CREATE TABLE players(
	name text NOT NULL,
	id serial PRIMARY KEY NOT NULL
);

CREATE TABLE matches(
	id serial PRIMARY KEY NOT NULL,
	winner int REFERENCES players (id) CHECK (winner != loser) NOT NULL,
	loser int REFERENCES players (id)
);
