-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament;

DROP VIEW IF EXISTS standings, wins, losses;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS players;

CREATE TABLE players(
	name text NOT NULL,
	id serial PRIMARY KEY NOT NULL
);

CREATE TABLE matches(
	id serial PRIMARY KEY NOT NULL,
	winner int REFERENCES players (id) CHECK (winner != loser) NOT NULL,
	loser int REFERENCES players (id) NOT NULL
);

CREATE VIEW wins
 AS (SELECT players.id as player, COUNT(matches.id) as wins FROM players LEFT JOIN matches ON players.id = matches.winner GROUP BY players.id ORDER BY wins DESC);

CREATE VIEW losses
 AS (SELECT players.id as player, COUNT(matches.id) as losses FROM players LEFT JOIN matches ON players.id = matches.loser GROUP BY players.id ORDER BY losses DESC);

CREATE VIEW standings
  AS (SELECT wins.player, wins.wins, losses.losses FROM wins JOIN losses ON wins.player = losses.player);
