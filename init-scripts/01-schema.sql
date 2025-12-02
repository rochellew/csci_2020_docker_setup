CREATE SCHEMA IF NOT EXISTS marvel;

DROP TABLE IF EXISTS marvel.character_comics CASCADE;
DROP TABLE IF EXISTS marvel.character_powers CASCADE;
DROP TABLE IF EXISTS marvel.powers CASCADE;
DROP TABLE IF EXISTS marvel.characters CASCADE;
DROP TABLE IF EXISTS marvel.comic_issues CASCADE;
CREATE TABLE marvel.comic_issues(
    id SERIAL PRIMARY KEY,
    series_name VARCHAR(100) NOT NULL,
    issue_number INTEGER NOT NULL,
    title VARCHAR(200),
    publication_date DATE
);
CREATE TABLE marvel.characters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    species VARCHAR(50),
    alignment VARCHAR(20) CHECK (
        alignment IN ('Hero', 'Villain', 'Anti-Hero', 'Neutral')
    ),
    status VARCHAR(20) CHECK (status IN ('Active', 'Deceased', 'Unknown')),
    team_affiliation VARCHAR(50)
);
CREATE TABLE marvel.powers(
    id SERIAL PRIMARY KEY,
    power_name VARCHAR(100) NOT NULL,
    power_type VARCHAR(50) CHECK (power_type IN ('Physical', 'Mental', 'Energy'))
);
CREATE TABLE marvel.character_powers(
    character_id INTEGER REFERENCES marvel.characters(id) ON DELETE CASCADE,
    power_id INTEGER REFERENCES marvel.powers(id) ON DELETE CASCADE,
    proficiency_level VARCHAR(20) CHECK (
        proficiency_level IN ('Beginner', 'Intermediate', 'Advanced', 'Master')
    ),
    PRIMARY KEY (character_id, power_id)
);
CREATE TABLE marvel.character_comics(
    character_id INTEGER REFERENCES marvel.characters(id) ON DELETE CASCADE,
    comic_issue_id INTEGER REFERENCES marvel.comic_issues(id) ON DELETE CASCADE,
    first_appearance BOOLEAN,
    PRIMARY KEY (character_id, comic_issue_id)
)