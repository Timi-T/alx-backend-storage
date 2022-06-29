-- Sql script to create a stored procedure

CREATE procedure ComputeAverageScoreForUser(IN user_id INT)
UPDATE users
SET average_score = (SELECT avg(score) FROM corrections c WHERE c.user_id = user_id)
WHERE id = user_id;
