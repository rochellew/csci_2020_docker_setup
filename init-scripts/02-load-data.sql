COPY comic_issues(
    id,
    series_name,
    issue_number,
    title,
    publication_date
)
FROM '/docker-entrypoint-initdb.d/comic_issues.csv' WITH CSV HEADER;
COPY characters(
    name,
    first_name,
    last_name,
    species,
    alignment,
    status,
    team_affiliation
)
FROM '/docker-entrypoint-initdb.d/characters.csv' WITH CSV HEADER;
COPY powers(id, power_name, power_type)
FROM '/docker-entrypoint-initdb.d/powers.csv' WITH CSV HEADER;
COPY character_powers(character_id, power_id, proficiency_level)
FROM '/docker-entrypoint-initdb.d/character_powers.csv' WITH CSV HEADER;
COPY character_comics(character_id, comic_issue_id, first_appearance)
FROM '/docker-entrypoint-initdb.d/character_comics.csv' WITH CSV HEADER;