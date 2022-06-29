-- Sql script to create a stored procedure

CREATE procedure ComputeAverageScoreForUser(IN user_id INT)
UPDATE users
SET average_score = (SELECT AVG(score) FROM corrections WHERE user_id = user_id)
WHERE id = user_id;
