DROP TABLE IF EXISTS character_comics CASCADE;
DROP TABLE IF EXISTS character_powers CASCADE;
DROP TABLE IF EXISTS powers CASCADE;
DROP TABLE IF EXISTS characters CASCADE;
DROP TABLE IF EXISTS comic_issues CASCADE;
CREATE TABLE comic_issues(
    id SERIAL PRIMARY KEY,
    series_name VARCHAR(100) NOT NULL,
    issue_number INTEGER NOT NULL,
    title VARCHAR(200),
    publication_date DATE
);
CREATE TABLE characters (
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
CREATE TABLE powers(
    id SERIAL PRIMARY KEY,
    power_name VARCHAR(100) NOT NULL,
    power_type VARCHAR(50) CHECK (power_type IN ('Physical', 'Mental', 'Energy'))
);
CREATE TABLE character_powers(
    character_id INTEGER REFERENCES characters(id) ON DELETE CASCADE,
    power_id INTEGER REFERENCES powers(id) ON DELETE CASCADE,
    proficiency_level VARCHAR(20) CHECK (
        proficiency_level IN ('Beginner', 'Intermediate', 'Advanced', 'Master')
    ),
    PRIMARY KEY (character_id, power_id)
);
CREATE TABLE character_comics(
    character_id INTEGER REFERENCES characters(id) ON DELETE CASCADE,
    comic_issue_id INTEGER REFERENCES comic_issues(id) ON DELETE CASCADE,
    first_appearance BOOLEAN,
    PRIMARY KEY (character_id, comic_issue_id)
)