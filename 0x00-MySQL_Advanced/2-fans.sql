-- Sql script to do sum operation on a table

-- Select the counries
SELECT origin as "origin",
-- Sum all the fans for the countries
sum(FANS) as "nb_fans"
-- specify the table to select from
FROM metal_bands
-- Group output by countries
GROUP BY origin
-- Order from highest number of fans
ORDER BY nb_fans DESC;
