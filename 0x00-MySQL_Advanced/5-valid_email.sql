-- Sql script to create an update trigger

DELIMITER $$
CREATE TRIGGER update_email
BEFORE UPDATE on users
FOR EACH ROW
IF (OLD.email != NEW.email)
    THEN SET NEW.valid_email = 0;
END IF;
$$
DELIMITER ;
