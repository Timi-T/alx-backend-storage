-- Sql script to create a procedure

DROP procedure IF EXISTS AddBonus;
DELIMITER $$
CREATE procedure AddBonus(IN user_id INT, IN project_name varchar(255), IN score INT)
BEGIN
    IF NOT EXISTS (SELECT name from projects WHERE name = project_name)
        INSERT INTO projects (name) VALUES (project_name)
    INSERT INTO corrections (user_id, project_id, score) values(user_id, (SELECT id FROM projects WHERE name = project_name), score);
END;
$$
DELIMITER ;
