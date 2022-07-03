-- Sql script to create a stored procedure that calculates weighted scores

DELIMITER $$
CREATE procedure ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
UPDATE users
SET average_score = CEILING((SELECT SUM(
    weight / (
        SELECT SUM(weight) FROM (SELECT projects.weight,
        corrections.score FROM projects
        JOIN corrections on projects.id = corrections.project_id
        WHERE corrections.user_id = user_id) new
    ) * score
) 
FROM (SELECT projects.name, projects.weight,
corrections.score FROM projects
JOIN corrections on projects.id = corrections.project_id
WHERE corrections.user_id = user_id) a))
WHERE id = user_id;
END
$$
DELIMITER ;
