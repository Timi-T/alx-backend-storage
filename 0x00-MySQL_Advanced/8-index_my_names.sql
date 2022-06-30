-- Sql script to create an index for first letter of names in a column

create index idx_name_first on names (name(1));
