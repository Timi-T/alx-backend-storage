-- Sql script to check lifespan of bands

-- Select band name
SELECT band_name AS "band_name",
-- Calculate lifespan
sum(split - formed) AS "lifespan"
-- Specify table to select from
FROM metal_bands
-- Filter based on style
WHERE style LIKE "%Glam rock%"
-- Group by the band name
GROUP BY band_name
-- Order by lifespan in descending order
ORDER BY lifespan DESC;
