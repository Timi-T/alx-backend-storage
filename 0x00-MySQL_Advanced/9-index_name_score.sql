-- Sql script to create an index for first letter of name and score

CREATE index idx_name_first_score on names (name(1), score);
